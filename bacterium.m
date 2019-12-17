classdef bacterium
   properties
       Species % includes species and strain
       Taxonomy % Class
       Genbank_Accession % of genome assembly
       ProteinID % NCBI reference to particular protein present
       Location % whether or not the type iv crispr operon is on a plasmid or genomic
       Fasta_g % file of genomic dna
       Fasta_p1 % file of the first plasmid, contains Type IV CRISPR if on plasmid
       Fasta_p2 % file of other plasmids
       Fasta_p3
       Fasta_p4
       Csf2_fasta % fasta sequence of csf2 only
       Plasmid_blast % data from blasting WGS data against Type IV Plasmid Sequences
       crispr % is there a crispr cassette
       crispr_start
       crispr_end
       othercrispr
       viral
       plasmid
       genomic
       unknown  
       recd
       ding
       cas1
       cas2
       cas3
       cas10
   end
   methods
       function [genomic, plasmids] = findtypeivplasmids(obj) % function was dropped as it was quicker to use web interface and get report 
           % due to computing limits of computer. But this method could
            % be used to determine which contigs are hits of Type IV
            % plasmids
            bresults = blastlocal('InputQuery',obj.Fasta_g,'Program','blastn','Database','plasmids.fasta','BlastPath','C:\Program Files\Blast\bin\blastall.exe');
       end
       function [genomic, plasmids, location] = separateplasmids(obj)
           contigs = {};
           if ~isempty(obj.Plasmid_blast)
              location = 'plasmid';
              file = fopen(obj.Plasmid_blast,'r');
                line1 = fgetl(file);
                q = 1; % counts lines
                while line1 ~= -1
                    var1 = strsplit(line1,',');
                    contigs{q} = var1(1);
                    line1 = fgetl(file);
                    q = q + 1;
                end 
              genomic = sprintf('%s_g.fasta',obj.Genbank_Accession);
              plasmids = sprintf('%s_plasmid.fasta',obj.Genbank_Accession);
              genfile = fopen(genomic,'wt');
              fprintf(genfile,sprintf('> %s genomic \n', obj.Species));
              plasmidfile = fopen(plasmids,'wt');
              fprintf(plasmidfile,sprintf('> %s plasmid \n', obj.Species));
              [cx,cy] = size(contigs);
              file = fopen(obj.Fasta_g,'r');
                line1 = fgetl(file);
                q = 1; % counts lines
                while line1 ~= -1
                    if strcmp(line1(1),'>')
                        current = 'genomic';
                        for aa = 1:cy
                            if ~isempty(strfind(line1,contigs{1,aa}))
                                current = 'plasmid';
                            end
                        end
                    else
                        if strcmp(current,'genomic')
                            fprintf(genfile,line1);
                        else
                            fprintf(plasmidfile,line1);
                        end
                    end
                    line1 = fgetl(file);
                    q = q + 1;
                end
                fclose('all');
           else
               location = 'genomic';
               genomic = sprintf('%s_g.fasta',obj.Genbank_Accession);
               plasmids = 0;
               genfile = fopen(genomic,'w');
                fprintf(genfile,sprintf('> %s genomic \n', obj.Species));
                file = fopen(obj.Fasta_g,'r');
                line1 = fgetl(file);
                q = 1; % counts lines
                while line1 ~= -1
                    if ~strcmp(line1(1),'>')
                        fprintf(genfile,line1);
                    end
                    line1 = fgetl(file);
                    q = q + 1;
                end
                fclose('all');
           end
       end
       function [cstart,cend,location, switches] = findcsf2(obj)
           switches = 0;
           file = fopen(obj.Csf2_fasta,'r');
           line1 = fgetl(file);
           q = 1; % counts lines
           csf_f = ''
           while line1 ~= -1
               if ~strcmp(line1(1),'>')
                  csf_f = strcat(csf_f,line1);
               end
                  line1 = fgetl(file);
                  q = q + 1;
           end
           file = fopen(obj.Fasta_g,'r');
           line1 = fgetl(file);
           q = 1; % counts lines
           genome = ''
           while line1 ~= -1
               if ~strcmp(line1(1),'>')
                  genome = strcat(csf_f,line1);
               end
                  line1 = fgetl(file);
                  q = q + 1;
           end
           csf_fc = ''
          for jj = 1:length(csf_f)
              switch csf_f(jj)
                  case 'a'
                      csf_fc = strcat(csf_fc,'t');
                  case 't'
                      csf_fc = strcat(csf_fc,'a');
                  case 'c'
                      csf_fc = strcat(csf_fc,'g');
                  case 'g'
                      csf_fc = strcat(csf_fc,'c');
              end
          end
          csf_r = reverese(csf_f);
          csf_rc = reverse(csf_fc);
          locf = strfind(csf_f,genome);
          if isempty(locf)
             loc
          else
              cstart = locf;
              cend = locf + length(csf_f);
              location = 'genomic';
              if strcmp(obj.location,'plasmid')
                  switches = 1;
              end
          end
       end
   end
end