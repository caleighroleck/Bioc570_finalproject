%% generate file for hits of type IV crisprs
% fasta sequence of csf2 - an identifying type IV CRISPR protein
csf2 = 'MIKRFSAFIRTRSPLHIAAPGSMRFDPATGKTVYGGQSVGVPCTGIQREVLFNEAGEAKHFPVIAANNISGRLRRHAARIILEAIRLRGQKVSLAVYNVLQCGAVTGNPDGKDMTLGEYRQYRDDPYFGLFGGGPKMMRRCLEVENALPVHADTTANLGSMAHPHAHRHAQGDHFTDVWGFRRNDDLRDLVNIHQAAEVVENFEAEFNARQQAILGEVDREKGSSKTSVKTYSALEFVRPGTLFDFSILMKWAISDAQAGLFLLTLDSLAETERLGGYGRNGFGRFSFDDAILLTSDGKEHQDAFHDGRLNREDPLVAHTLSAWHAASQKIDATALANLIAPDRGAAPDRGAA';
% prevent query from timing out in 5 seconds
weboptions.Timeout = 999999999999999999999999999999;
% perform blast search to find potential csf2 homologs
[ivresults,ivtime] = blastncbi(csf2,'blastp','expect',0.001);
typeivhits = getblast(ivresults,'WaitTime',ivtime,'ToFile','typeivhits_report.xml');
%% read blast data and generate list of accession numbers of hit
typeivresults = blastread('typeivhits_report.xml');
hits = typeivresults.Hits;
[hx,hy] = size(hits);
hit_ID = {};
hitfile = fopen('TypeIV_Hit_IDs.txt','w');
for ii = 1:hy
   fprintf(hitfile,hits(ii).Accession);
   fprintf(hitfile,'\n');
   hit_ID{ii} = hits(ii).Accession;
end
%% generate classes for each genome assembly linked to a protein hit and stores
% it in an object array

gcf_21 = bacterium;
gcf_21.Species = 'Acidithiobacillus ferrooxidans ATCC 23270';
gcf_21.Genbank_Accession = 'GCA_000021485';
gcf_21.ProteinID = 'WP_012606750';
gcf_21.Csf2_fasta = 'gcf_21_csf2.fasta';
gcf_21.Location = 'genomic';
gcf_21.Fasta_g = 'gcf_21_g.fasta';
gcf_21.Taxonomy = 'Acidithiobacillia';
gcf_21.crispr = 1;
gcf_21.othercrispr = 0;
gcf_21.crispr_start = 2297641;
gcf_21.crispr_end = 2297739;
gcf_21.unknown = 1;
gcf_21.plasmid = 0;
gcf_21.genomic = 0;
gcf_21.viral = 0;

typeivs = [gcf_21];

gcf_18 = bacterium;
gcf_18.ProteinID = 'WP_071182680';
gcf_18.Species = 'Acidithiobacillus ferrooxidans PQ33';
gcf_18.Genbank_Accession = 'GCA_001857665';
gcf_18.Location = 'unknown';
gcf_18.Csf2_fasta = 'gcf_18_csf2.fasta';
gcf_18.Fasta_g = 'gcf_18_g.fsa_nt';
gcf_18.Plasmid_blast = 'gcf_18.csv';
gcf_18.Taxonomy = 'Acidithiobacillia';

typeivs = [typeivs, gcf_18];

gca_93 = bacterium;
gca_93.ProteinID = 'MPS90335';
gca_93.Taxonomy = 'betaproteobacteria';
gca_93.Species = 'Comamonas sp.';
gca_93.Genbank_Accession = 'GCA_009360535.1';
gca_93.Csf2_fasta = 'gca_93_csf2.fasta';
gca_93.Location = 'unknown';
gca_93.Fasta_g = 'gca_93_g.fsa_nt';
gca_93.Plasmid_blast = 'gca_93.csv';

typeivs = [typeivs, gca_93];

gca_19 = bacterium;
gca_19.ProteinID = 'WP_075588190';
gca_19.Species = 'Rhodoferax antarcticus ANT.BR';
gca_19.Taxonomy = 'betaproteobacteria';
gca_19.Genbank_Accession = 'GCA_001938565.1';
gca_19.Csf2_fasta = 'gca_19_csf2.fasta';
gca_19.Location = 'unknown';
gca_19.Fasta_g = 'gca_19_g.fsa_nt';
gca_19.Plasmid_blast = 'gca_19.csv';


typeivs = [typeivs, gca_19];

gca_35 = bacterium;
gca_35.ProteinID = 'RGE40942';
gca_35.Species = 'Comamonas testosteroni SWCO2';
gca_35.Taxonomy = 'betaproteobacteria';
gca_35.Genbank_Accession = 'GCA_003569915.1';
gca_35.Csf2_fasta = 'gca_35_csf2';
gca_35.Location = 'unknown';
gca_35.Fasta_g = 'gca_35_g.fsa_nt';
gca_35.Plasmid_blast = '';


typeivs = [typeivs, gca_35];

gca_38 = bacterium;
gca_38.ProteinID = 'WP_019584538';
gca_38.Species = 'Thioalkalivibrio sp. ALE16';
gca_38.Taxonomy ='gammaproteobacteria';
gca_38.Genbank_Accession = 'GCF_000381305.1';
gca_38.Csf2_fasta = 'gca_38_csf2.fasta';
gca_38.Location = 'unknown';
gca_38.Fasta_g = 'gca_38_g.fsa_nt';
gca_38.Plasmid_blast = 'gca_38.csv';


typeivs = [typeivs, gca_38];

gca_37 = bacterium;
gca_37.ProteinID = 'WP_013006553';
gca_37.Species = 'Thioalkalivibrio sp. AKL11';
gca_37.Taxonomy = 'gammaproteobacteria';
gca_37.Genbank_Accession = 'GCF_000377845.1';
gca_37.Csf2_fasta = 'gca_37_csf2.fasta';
gca_37.Location = 'unknown';
gca_37.Fasta_g = 'gca_37_g.fsa_nt';
gca_37.Plasmid_blast = 'gca_37.csv';


typeivs = [typeivs, gca_37];

gcf_25 = bacterium;
gcf_25.Genbank_Accession = 'GCF_000025545.1';
gcf_25.ProteinID = 'WP_013006553';
gcf_25.Species = 'Thioalkalivibrio sp. K90mix';
gcf_25.Taxonomy = 'gammaproteobacteria';
gcf_25.Csf2_fasta = 'gca_25_csf2.fasta';
gcf_25.Location = 'plasmid';
gcf_25.Fasta_g = 'gca_25_g.fasta';
gcf_25.Fasta_p1 = 'gca_25_p1.fasta';
gcf_25.crispr = 1;
gcf_25.unknown = 7;
gcf_25.genomic = 0;
gcf_25.plasmid = 0;
gcf_25.viral = 0;
gcf_25.othercrispr = 1;
gcf_25.recd = 0;
gcf_25.ding = 1;
gcf_25.cas1 = 0;
gcf_25.cas2 = 0;
gcf_25.cas3 = 0;
gcf_25.cas10 = 0;

typeivs = [typeivs, gcf_25];

gca_27 = bacterium;
gca_27.ProteinID = 'PIV35213';
gca_27.Species = 'Xanthomonadales bacterium CG02_land_8_20_14_3_00_62_12';
gca_27.Taxonomy = 'gammaproteobacteria';
gca_27.Genbank_Accession = 'GCA_002785585.1';
gca_27.Csf2_fasta = 'gca_27_csf2.fasta';
gca_27.Location = 'unknown';
gca_27.Fasta_g = 'gca_27_g.fsa_nt';
gca_27.Plasmid_blast = 'gca_27.csv';

typeivs = [typeivs, gca_27];

gca_82 = bacterium;
gca_82.ProteinID = 'WP_040202870';
gca_82.Species = 'Geoalkalibacter subterraneus Red1';
gca_82.Taxonomy = 'deltaproteobacteria';
gca_82.Genbank_Accession = 'GCF_000827125.1';
gca_82.Csf2_fasta = 'gca_82_csf2.fasta';
gca_82.Location = 'plasmid';
gca_82.Fasta_g = 'gca_82_g.fasta';
gca_82.Fasta_p1 = 'gca_82_p1.fasta';
gca_82.crispr = 1;
gca_82.unknown = 11;
gca_82.genomic = 2;
gca_82.plasmid = 0;
gca_82.viral = 0;
gca_82.othercrispr = 1;
gca_82.cas2 = 0;
gca_82.cas1 = 0;
gca_82.ding = 1;
gca_82.recd = 0;
gca_82.cas3 = 0;
gca_82.cas10 = 0;

% the two genomics targeted the genome of the same organism


typeivs = [typeivs, gca_82];

gca_272 = bacterium;
gca_272.ProteinID = 'MBQ68989';
gca_272.Species = 'Candidatus Saccharibacteria bacterium';
gca_272.Taxonomy = 'unclassified';
gca_272.Genbank_Accession = 'GCA_002726935.1';
gca_272.Csf2_fasta = 'gca_272_csf2.fasta';
gca_272.Location = 'unknown';
gca_272.Fasta_g = 'gca_272_g.fsa_nt';
gca_272.Plasmid_blast = '';

typeivs = [typeivs, gca_272];

gca_36 = bacterium;
gca_36.ProteinID = 'RME80669';
gca_36.Species = 'Zetaproteobacteria bacterium J098';
gca_36.Taxonomy = 'zetaproteobacteria';
gca_36.Genbank_Accession = 'GCA_003694935.1';
gca_36.Csf2_fasta = 'gca_36_csf2.fasta';
gca_36.Location = 'unknown';
gca_36.Fasta_g = 'gca_36_g.fsa_nt';
gca_36.Plasmid_blast = '';

typeivs = [typeivs, gca_36];

gca_3858 = bacterium;
gca_3858.ProteinID = 'WP_124825525';
gca_3858.Species = 'Burkholderia sp. Bp9017';
gca_3858.Taxonomy = 'betaproteobacteria';
gca_3858.Genbank_Accession = 'GCF_003858015.1';
gca_3858.Csf2_fasta = 'gca_3858_csf2.fasta';
gca_3858.Location = 'unknown';
gca_3858.Fasta_g = 'gca_3858_g.fsa_nt';
gca_3858.Plasmid_blast = 'gca_3858.csv';

typeivs = [typeivs, gca_3858];

gca_3857 = bacterium;
gca_3857.ProteinID = 'WP_124825525';
gca_3857.Species = 'Burkholderia sp. Bp9016';
gca_3857.Taxonomy = 'betaproteobacteria';
gca_3857.Genbank_Accession = 'GCF_003857765.1';
gca_3857.Csf2_fasta = 'gca_3857_csf2.fasta';
gca_3857.Location = 'unknown';
gca_3857.Fasta_g = 'gca_3857_g.fsa_nt';
gca_3857.Plasmid_blast = 'gca_3857.csv';

typeivs = [typeivs, gca_3857];

gca_0027 = bacterium;
gca_0027.ProteinID = 'MBT42585';
gca_0027.Species = 'Idiomarina sp. isolate NP27';
gca_0027.Taxonomy = 'gammaproteobacteria';
gca_0027.Genbank_Accession = 'GCA_002729675.1';
gca_0027.Csf2_fasta = 'gca_0027_csf2.fasta';
gca_0027.Location = 'unknown';
gca_0027.Fasta_g = 'gca_0027_g.fsa_nt';
gca_0027.Plasmid_blast = '';

typeivs = [typeivs, gca_0027];

gcf7 = bacterium;
gcf7.ProteinID = 'WP_029308491';
gcf7.Species = 'Cupriavidus metallidurans strain NA4';
gcf7.Taxonomy = 'betaproteobacteria';
gcf7.Genbank_Accession = 'GCF_000709045.1';
gcf7.Csf2_fasta = 'gcf7_csf2.fasta';
gcf7.Location = 'unknown';
gcf7.Fasta_g = 'gcf7_g.fsa_nt';
gcf7.Plasmid_blast = 'gcf7.csv';

typeivs = [typeivs, gcf7];

gcf9 = bacterium;
gcf9.ProteinID = 'WP_080957767';
gcf9.Species = 'Burkholderia vietnamiensis CBMB40';
gcf9.Taxonomy = 'betaproteobacteria';
gcf9.Genbank_Accession = 'GCF_000980955.1';
gcf9.Csf2_fasta = 'gcf9_csf2.fasta';
gcf9.Location = 'unknown';
gcf9.Fasta_g = 'gcf9_g.fsa_nt';
gcf9.Plasmid_blast = 'gcf9.csv';
% KKI36123 is the same csf2 just starting at a later start codon 150900

typeivs = [typeivs, gcf9];

gcf91 = bacterium;
gcf91.ProteinID = 'WP_152090938';
gcf91.Species = 'Azospira sp. I09';
gcf91.Taxonomy = 'betaproteobacteria';
gcf91.Genbank_Accession = 'GCF_009177135.1';
gcf91.Csf2_fasta = 'gcf91_csf2.fasta';
gcf91.Location = 'plasmid';
gcf91.Fasta_g = 'gcf91_g.fasta';
gcf91.Fasta_p1 = 'gcf91_p1.fasta';
gcf91.crispr = 1;
gcf91.othercrispr = 0;
gcf91.unknown = 4;
gcf91.genomic = 0;
gcf91.plasmid = 0;
gcf91.viral = 0;
gcf91.recd = 0;
gcf91.ding = 1;
gcf91.cas1 = 0;
gcf91.cas2 = 0;
gcf91.cas3 = 1;
gcf91.cas10 = 0;

typeivs = [typeivs, gcf91];

gcf47 = bacterium;
gcf47.ProteinID = 'WP_135406395';
gcf47.Species = 'Pseudomonas aeruginosa 91';
gcf47.Taxonomy = 'gammaproteobacteria';
gcf47.Genbank_Accession = 'GCF_004764765.1';
gcf47.Csf2_fasta = 'gcf47_csf2.fasta';
gcf47.Location = 'unknown';
gcf47.Fasta_g = 'gcf47_g.fsa_nt';
gcf47.Plasmid_blast = 'gcf47.csv';

typeivs = [typeivs, gcf47];

gcf22 = bacterium;
gcf22.ProteinID = 'WP_135406395';
gcf22.Species = 'Pseudomonas sp. 34-62-33';
gcf22.Taxonomy = 'gammaproteobacteria';
gcf22.Genbank_Accession = 'GCA_002282595.1';
gcf22.Csf2_fasta = 'gcf22_csf2.fasta';
gcf22.Location = 'unknown';
gcf22.Fasta_g = 'gcf22_g.fsa_nt';
gcf22.Plasmid_blast = 'gcf22.csv';

typeivs = [typeivs, gcf22];

gcf17 = bacterium;
gcf17.ProteinID = 'WP_073937550';
gcf17.Species = 'Pseudomonas aeruginosa DN1';
gcf17.Taxonomy = 'gammaproteobacteria';
gcf17.Genbank_Accession = 'GCF_001722005.2';
gcf17.Csf2_fasta = 'gcf17_csf2.fasta';
gcf17.Location = 'plasmid';
gcf17.Fasta_g = 'gcf17_g.fasta';
gcf17.Fasta_p1 = 'gcf17_p1.fasta';
gcf17.crispr = 1;
gcf17.othercrispr = 1;
gcf17.plasmid = 0;
gcf17.viral = 0;
gcf17.genomic = 14;
gcf17.unknown = 11;
gcf17.cas2 = 0;
gcf17.cas1 = 0;
gcf17.ding = 0;
gcf17.recd = 1;
gcf17.cas3 = 0;
gcf17.cas10 = 0;

typeivs = [typeivs, gcf17];

gcf4 = bacterium;
gcf4.ProteinID = 'WP_073937550';
gcf4.Species = 'Pseudomonas sp. HS-2';
gcf4.Taxonomy = 'gammaproteobacteria';
gcf4.Genbank_Accession = 'GCF_004369025.1';
gcf4.Csf2_fasta = 'gcf4_csf2.fasta';
gcf4.Location = 'unknown';
gcf4.Fasta_g = 'gcf4_g.fsa_nt';
gcf4.Plasmid_blast = 'gcf4.csv';

typeivs = [typeivs, gcf4];

gcf28 = bacterium;
gcf28.ProteinID = 'WP_073937550';
gcf28.Species = 'Pseudomonas sp. ZH-FAD';
gcf28.Taxonomy = 'gammaproteobacteria';
gcf28.Genbank_Accession = 'GCF_002803095.1';
gcf28.Csf2_fasta = 'gcf28_csf2.fasta';
gcf28.Location = 'unknown';
gcf28.Fasta_g = 'gcf28_g.fsa_nt';
gcf28.Plasmid_blast = 'gcf28.csv';


typeivs = [typeivs, gcf28];

gcf41 = bacterium;
gcf41.ProteinID = 'WP_020308258';
gcf41.Species = 'Pseudomonas stutzeri B1SMN1';
gcf41.Taxonomy = 'gammaproteobacteria';
gcf41.Genbank_Accession = 'GCF_000416345.1';
gcf41.Csf2_fasta = 'gcf41_csf2.fasta';
gcf41.Location = 'unknown';
gcf41.Fasta_g = 'gcf41_g.fsa_nt';
gcf41.Plasmid_blast = 'gcf41.csv';


typeivs = [typeivs, gcf41];

gcf23 = bacterium;
gcf23.ProteinID = 'WP_020308258';
gcf23.Species = 'Pseudomonas putida KF715';
gcf23.Taxonomy = 'gammaproteobacteria';
gcf23.Genbank_Accession = 'GCF_002356095.1';
gcf23.Csf2_fasta = 'gcf23_csf2.fasta';
gcf23.Location = 'plasmid';
gcf23.Fasta_g = 'gcf23_g.fasta';
gcf23.Fasta_p1 = 'gcf23_p1.fasta';
gcf23.Fasta_p2 = 'gcf23_p2.fasta';
gcf23.Fasta_p3 = 'gcf23_p3.fasta';
gcf23.Fasta_p4 = 'gcf23_p4.fasta';
gcf23.crispr = 1;
gcf23.othercrispr = 1;
gcf23.viral = 0;
gcf23.plasmid = 1;
gcf23.genomic = 1;
gcf23.unknown = 9;
gcf23.recd = 1;
gcf23.ding = 0;
gcf23.cas1 = 0;
gcf23.cas2 = 0;
gcf23.cas3 = 0;
gcf23.cas10 = 0;

typeivs = [typeivs, gcf23];

gca90 = bacterium;
gca90.ProteinID = 'WP_092942664';
gca90.Species = 'Acidovorax wautersii';
gca90.Taxonomy = 'betaproteobacteria';
gca90.Genbank_Accession = 'GCA_900113035.1';
gca90.Csf2_fasta = 'gca90_csf2.fasta';
gca90.Location = 'unknown';
gca90.Fasta_g = 'gca90.fsa_nt';
gca90.Plasmid_blast = 'gca90.csv';


typeivs = [typeivs, gca90];

gca39 = bacterium;
gca39.ProteinID = 'WP_128668219';
gca39.Species = 'Pseudomonas aeruginosa T3354';
gca39.Taxonomy = 'gammaproteobacteria';
gca39.Genbank_Accession = 'GCA_003975965.1';
gca39.Csf2_fasta = 'gca39_csf2.fasta';
gca39.Location = 'unknown';
gca39.Fasta_g = 'gca39.fsa_nt';
gca39.Plasmid_blast = 'gca39.csv';


typeivs = [typeivs, gca39];

gca098 = bacterium;
gca098.ProteinID = 'WP_023100586';
gca098.Species = 'Pseudomonas aeruginosa S04 90';
gca098.Taxonomy = 'gammaproteobacteria';
gca098.Genbank_Accession = 'GCA_000988505.1';
gca098.Csf2_fasta = 'gca098_csf2.fasta';
gca098.Location = 'plasmid';
gca098.Fasta_g = 'gca098_g.fasta';
gca098.Fasta_p1 = 'gca098_p1.fasta';
gca098.crispr = 1;
gca098.othercrispr = 1;
gca098.plasmid = 0;
gca098.viral = 0;
gca098.genomic = 1;
gca098.unknown = 5;
gca098.cas2 = 0;
gca098.cas1 = 0;
gca098.ding = 0;
gca098.recd = 0;
gca098.cas3 = 0;
gca098.cas10 = 0;

typeivs = [typeivs, gca098];

gca357 = bacterium;
gca357.ProteinID = 'WP_023100586';
gca357.Species = 'Pseudomonas aeruginosa AR 0111';
gca357.Taxonomy = 'gammaproteobacteria';
gca357.Genbank_Accession = 'GCA_000988505.1';
gca357.Csf2_fasta = 'gca357_csf2.fasta';
gca357.Location = 'plasmid';
gca357.Fasta_g = 'gca357_g.fasta';
gca357.Fasta_p1 = 'gca357_p1.fasta';
gca357.crispr = 1;
gca357.othercrispr = 1;
gca357.plasmid = 1;
gca357.genomic = 1;
gca357.unknown = 2;
gca357.plasmid = 0;
gca357.viral = 0;
gca357.recd = 0;
gca357.ding = 0;
gca357.cas1 = 0;
gca357.cas2 = 0;
gca357.cas3 = 0;
gca357.cas10 = 0;

typeivs = [typeivs, gca357];

gca395 = bacterium;
gca395.ProteinID = 'WP_023100586';
gca395.Species = 'Pseudomonas aeruginosa Imp-13';
gca395.Taxonomy = 'gammaproteobacteria';
gca395.Genbank_Accession = 'GCA_003950015.1';
gca395.Csf2_fasta = 'gca395_csf2.fasta';
gca395.Location = 'plasmid';
gca395.Fasta_g = 'gca395_g.fasta';
gca395.Fasta_p1 = 'gca395_p1.fasta';
gca395.crispr = 1;
gca395.othercrispr = 1;
gca395.genomic = 1;
gca395.unknown = 5;
gca395.viral = 0;
gca395.plasmid = 0;
gca395.cas2 = 0;
gca395.cas1 = 0;
gca395.ding = 0;
gca395.recd = 0;
gca395.cas3 = 0;
gca395.cas10 = 0;

typeivs = [typeivs, gca395];

gca118 = bacterium;
gca118.ProteinID = 'WP_023100586';
gca118.Species = 'Pseudomonas aeruginosa P26_Wales_1_VIM_2_11_10';
gca118.Taxonomy = 'gammaproteobacteria';
gca118.Genbank_Accession = 'GCA_001180925.1';
gca118.Csf2_fasta = 'gca118_csf2.fasta';
gca118.Location = 'unknown';
gca118.Fasta_g = 'gca118.fsa_nt';
gca118.Plasmid_blast = 'gca118.csv';

typeivs = [typeivs, gca118];

gca1181 = bacterium;
gca1181.ProteinID = 'WP_023100586';
gca1181.Species = 'Pseudomonas aeruginosa P31_Wales_1_VIM_2_11_11';
gca1181.Taxonomy = 'gammaproteobacteria';
gca1181.Genbank_Accession = 'GCA_001181025.1';
gca1181.Csf2_fasta = 'gca1181_csf2.fasta';
gca1181.Location = 'unknown';
gca1181.Fasta_g = 'gca1181.fsa_nt';
gca1181.Plasmid_blast = 'gca1181.csv';

typeivs = [typeivs, gca1181];

gca0118 = bacterium;
gca0118.ProteinID = 'WP_023100586';
gca0118.Species = 'Pseudomonas aeruginosa P19_London_7_VIM_2_05_10';
gca0118.Taxonomy = 'gammaproteobacteria';
gca0118.Genbank_Accession = 'GCA_001180785.1';
gca0118.Csf2_fasta = 'gca0118_csf2.fasta';
gca0118.Location = 'unknown';
gca0118.Fasta_g = 'gca0118.fsa_nt';
gca0118.Plasmid_blast = 'gca0118.csv';

typeivs = [typeivs, gca0118];

gca011809 = bacterium;
gca011809.ProteinID = 'WP_023100586';
gca011809.Species = 'Pseudomonas aeruginosa  P27_Wales_1_VIM_2_02_11';
gca011809.Taxonomy = 'gammaproteobacteria';
gca011809.Genbank_Accession = 'GCA_001180945.1';
gca011809.Csf2_fasta = 'gca011809_csf2.fasta';
gca011809.Location = 'unknown';
gca011809.Fasta_g = 'gca011809.fsa_nt';
gca011809.Plasmid_blast = 'gca011809.csv';

typeivs = [typeivs, gca011809];

gca011829 = bacterium;
gca011829.ProteinID = 'WP_023100586';
gca011829.Species = 'Pseudomonas aeruginosa P44_Wales_1_VIM_2_11_12';
gca011829.Taxonomy = 'gammaproteobacteria';
gca011829.Genbank_Accession = 'GCA_001182945.1';
gca011829.Csf2_fasta = 'gca011829_csf2.fasta';
gca011829.Location = 'unknown';
gca011829.Fasta_g = 'gca011829.fsa_nt';
gca011829.Plasmid_blast = 'gca011829.csv';

typeivs = [typeivs, gca011829];

gca011818 = bacterium;
gca011818.ProteinID = 'WP_023100586';
gca011818.Species = 'Pseudomonas aeruginosa P59_Wales_1_VIM_2_09_13';
gca011818.Taxonomy = 'gammaproteobacteria';
gca011818.Genbank_Accession = 'GCA_001181885.1';
gca011818.Csf2_fasta = 'gca011818_csf2.fasta';
gca011818.Location = 'unknown';
gca011818.Fasta_g = 'gca011818.fsa_nt';
gca011818.Plasmid_blast = 'gca011818.csv';

typeivs = [typeivs, gca011818];

gca79 = bacterium;
gca79.ProteinID = 'WP_023100586';
gca79.Species = 'Pseudomonas aeruginosa AZPAE15071';
gca79.Taxonomy = 'gammaproteobacteria';
gca79.Genbank_Accession = 'GCA_000793505.1';
gca79.Csf2_fasta = 'gca79_csf2.fasta';
gca79.Location = 'unknown';
gca79.Fasta_g = 'gca79.fsa_nt';
gca79.Plasmid_blast = 'gca79.csv';


typeivs = [typeivs, gca79];

gca792 = bacterium;
gca792.ProteinID = 'WP_023100586';
gca792.Species = 'Pseudomonas aeruginosa AZPAE15010';
gca792.Taxonomy = 'gammaproteobacteria';
gca792.Genbank_Accession = 'GCA_000792855.1';
gca792.Csf2_fasta = 'gca792_csf2.fasta';
gca792.Location = 'unknown';
gca792.Fasta_g = 'gca792.fsa_nt';
gca792.Plasmid_blast = 'gca792.csv';

typeivs = [typeivs, gca792];

gca794 = bacterium;
gca794.ProteinID = 'WP_023100586';
gca794.Species = 'Pseudomonas aeruginosa AZPAE14831';
gca794.Taxonomy = 'gammaproteobacteria';
gca794.Genbank_Accession = 'GCA_000794175.1';
gca794.Csf2_fasta = 'gca794_csf2.fasta';
gca794.Location = 'unknown';
gca794.Fasta_g = 'gca794.fsa_nt';
gca794.Plasmid_blast = 'gca794.csv';

typeivs = [typeivs, gca794];

gca795 = bacterium;
gca795.ProteinID = 'WP_023100586';
gca795.Species = 'Pseudomonas aeruginosa AZPAE14826';
gca795.Taxonomy = 'gammaproteobacteria';
gca795.Genbank_Accession = 'GCA_000795345.1';
gca795.Csf2_fasta = 'gca795_csf2.fasta';
gca795.Location = 'unknown';
gca795.Fasta_g = 'gca795.fsa_nt';
gca795.Plasmid_blast = 'gca795.csv';

typeivs = [typeivs, gca795];

gca796 = bacterium;
gca796.ProteinID = 'WP_023100586';
gca796.Species = 'Pseudomonas aeruginosa AZPAE14715';
gca796.Taxonomy = 'gammaproteobacteria';
gca796.Genbank_Accession = 'GCA_000796725.1';
gca796.Csf2_fasta = 'gca796_csf2.fasta';
gca796.Location = 'unknown';
gca796.Fasta_g = 'gca796.fsa_nt';
gca796.Plasmid_blast = 'gca796.csv';

typeivs = [typeivs, gca796];

gca797 = bacterium;
gca797.ProteinID = 'WP_023100586';
gca797.Species = 'Pseudomonas aeruginosa AZPAE14711';
gca797.Taxonomy = 'gammaproteobacteria';
gca797.Genbank_Accession = 'GCA_000797345.1';
gca797.Csf2_fasta = 'gca797_csf2.fasta';
gca797.Location = 'unknown';
gca797.Fasta_g = 'gca797.fsa_nt';
gca797.Plasmid_blast = 'gca797.csv';

typeivs = [typeivs, gca797];

gca481 = bacterium;
gca481.ProteinID = 'WP_023100586';
gca481.Species = 'Pseudomonas aeruginosa BWHPSA028';
gca481.Taxonomy = 'gammaproteobacteria';
gca481.Genbank_Accession = 'GCA_000481145.1';
gca481.Csf2_fasta = 'gca481_csf2.fasta';
gca481.Location = 'unknown';
gca481.Fasta_g = 'gca481.fsa_nt';
gca481.Plasmid_blast = 'gca481.csv';

typeivs = [typeivs, gca481];

gca52 = bacterium;
gca52.ProteinID = 'WP_023100586';
gca52.Species = 'Pseudomonas aeruginosa PS42';
gca52.Taxonomy = 'gammaproteobacteria';
gca52.Genbank_Accession = 'GCA_000520195.1';
gca52.Csf2_fasta = 'gca52_csf2.fasta';
gca52.Location = 'unknown';
gca52.Fasta_g = 'gca52.fsa_nt';
gca52.Plasmid_blast = 'gca52.csv';

typeivs = [typeivs, gca52];

gca14 = bacterium;
gca14.ProteinID = 'WP_023100586';
gca14.Species = 'Pseudomonas aeruginosa WH-SGI-V-07172';
gca14.Taxonomy = 'gammaproteobacteria';
gca14.Genbank_Accession = 'GCA_001449585.1';
gca14.Csf2_fasta = 'gca14_csf2.fasta';
gca14.Location = 'unknown';
gca14.Fasta_g = 'gca14.fsa_nt';
gca14.Plasmid_blast = 'gca14.csv';

typeivs = [typeivs, gca14];

gca145 = bacterium;
gca145.ProteinID = 'WP_023100586';
gca145.Species = 'Pseudomonas aeruginosa WH-SGI-V-07240';
gca145.Taxonomy = 'gammaproteobacteria';
gca145.Genbank_Accession = 'GCA_001450045.1';
gca145.Csf2_fasta = 'gca145_csf2.fasta';
gca145.Location = 'unknown';
gca145.Fasta_g = 'gca145.fsa_nt';
gca145.Plasmid_blast = 'gca145.csv';

typeivs = [typeivs, gca145];

gca0145 = bacterium;
gca0145.ProteinID = 'WP_023100586';
gca0145.Species = 'Pseudomonas aeruginosa WH-SGI-V-07368';
gca0145.Taxonomy = 'gammaproteobacteria';
gca0145.Genbank_Accession = 'GCA_001450115.1';
gca0145.Csf2_fasta = 'gca0145_csf2.fasta';
gca0145.Location = 'unknown';
gca0145.Fasta_g = 'gca0145.fsa_nt';
gca0145.Plasmid_blast = 'gca0145.csv';

typeivs = [typeivs, gca0145];

gca01453 = bacterium;
gca01453.ProteinID = 'WP_023100586';
gca01453.Species = 'Pseudomonas aeruginosa WH-SGI-V-07259';
gca01453.Taxonomy = 'gammaproteobacteria';
gca01453.Genbank_Accession = 'GCA_001453885.1';
gca01453.Csf2_fasta = 'gca01453_csf2.fasta';
gca01453.Location = 'unknown';
gca01453.Fasta_g = 'gca01453.fsa_nt';
gca01453.Plasmid_blast = 'gca01453.csv';

typeivs = [typeivs, gca01453];

gca1453 = bacterium;
gca1453.ProteinID = 'WP_023100586';
gca1453.Species = 'Pseudomonas aeruginosa WH-SGI-V-07263';
gca1453.Taxonomy = 'gammaproteobacteria';
gca1453.Genbank_Accession = 'GCA_001453015.1';
gca1453.Csf2_fasta = 'gca1453_csf2.fasta';
gca1453.Location = 'unknown';
gca1453.Fasta_g = 'gca1453.fsa_nt';
gca1453.Plasmid_blast = 'gca1453.csv';

typeivs = [typeivs, gca1453];

gca14539 = bacterium;
gca14539.ProteinID = 'WP_023100586';
gca14539.Species = 'Pseudomonas aeruginosa WH-SGI-V-07273';
gca14539.Taxonomy = 'gammaproteobacteria';
gca14539.Genbank_Accession = 'GCA_001453905.1';
gca14539.Csf2_fasta = 'gca14539_csf2.fasta';
gca14539.Location = 'unknown';
gca14539.Fasta_g = 'gca14539.fsa_nt';
gca14539.Plasmid_blast = 'gca14539.csv';

typeivs = [typeivs, gca14539];

gca1454 = bacterium;
gca1454.ProteinID = 'WP_023100586';
gca1454.Species = 'Pseudomonas aeruginosa WH-SGI-V-07327';
gca1454.Taxonomy = 'gammaproteobacteria';
gca1454.Genbank_Accession = 'GCA_001454825.1';
gca1454.Csf2_fasta = 'gca1454_csf2.fasta';
gca1454.Location = 'unknown';
gca1454.Fasta_g = 'gca1454.fsa_nt';
gca1454.Plasmid_blast = 'gca1454.csv';

typeivs = [typeivs, gca1454];

gca160 = bacterium;
gca160.ProteinID = 'WP_023100586';
gca160.Species = 'Pseudomonas aeruginosa 105819';
gca160.Taxonomy = 'gammaproteobacteria';
gca160.Genbank_Accession = 'GCA_001601745.1';
gca160.Csf2_fasta = 'gca160_csf2.fasta';
gca160.Location = 'unknown';
gca160.Fasta_g = 'gca160.fsa_nt';
gca160.Plasmid_blast = 'gca160.csv';

typeivs = [typeivs, gca160];

gca175 = bacterium;
gca175.ProteinID = 'WP_023100586';
gca175.Species = 'Pseudomonas aeruginosa Br993';
gca175.Taxonomy = 'gammaproteobacteria';
gca175.Genbank_Accession = 'GCA_001756405.1';
gca175.Csf2_fasta = 'gca175_csf2.fasta';
gca175.Location = 'unknown';
gca175.Fasta_g = 'gca175.fsa_nt';
gca175.Plasmid_blast = 'gca175.csv';

typeivs = [typeivs, gca175];

gca369 = bacterium;
gca369.ProteinID = 'WP_023100586';
gca369.Species = 'Pseudomonas aeruginosa E429';
gca369.Taxonomy = 'gammaproteobacteria';
gca369.Genbank_Accession = 'GCA_003698495.1';
gca369.Csf2_fasta = 'gca369_csf2.fasta';
gca369.Location = 'unknown';
gca369.Fasta_g = 'gca369.fsa_nt';
gca369.Plasmid_blast = 'gca369.csv';

typeivs = [typeivs, gca369];

gca19 = bacterium;
gca19.ProteinID = 'WP_023100586';
gca19.Species = 'Pseudomonas aeruginosa 560747';
gca19.Taxonomy = 'gammaproteobacteria';
gca19.Genbank_Accession = 'GCA_001909495.1';
gca19.Csf2_fasta = 'gca19_csf2.fasta';
gca19.Location = 'unknown';
gca19.Fasta_g = 'gca19.fsa_nt';
gca19.Plasmid_blast = 'gca19.csv';

typeivs = [typeivs, gca19];

gca20 = bacterium;
gca20.ProteinID = 'WP_023100586';
gca20.Species = 'Pseudomonas aeruginosa ICBDVIM-2';
gca20.Taxonomy = 'gammaproteobacteria';
gca20.Genbank_Accession = 'GCA_002029925.1';
gca20.Csf2_fasta = 'gca20_csf2.fasta';
gca20.Location = 'unknown';
gca20.Fasta_g = 'gca20.fsa_nt';
gca20.Plasmid_blast = 'gca20.csv';

typeivs = [typeivs, gca20];

gca21 = bacterium;
gca21.ProteinID = 'WP_023100586';
gca21.Species = 'Pseudomonas aeruginosa S700_C14_RS';
gca21.Taxonomy = 'gammaproteobacteria';
gca21.Genbank_Accession = 'GCA_002135765.1';
gca21.Csf2_fasta = 'gca21_csf2.fasta';
gca21.Location = 'unknown';
gca21.Fasta_g = 'gca21.fsa_nt';
gca21.Plasmid_blast = 'gca21.csv';

typeivs = [typeivs, gca21];

gca213 = bacterium;
gca213.ProteinID = 'WP_023100586';
gca213.Species = 'Pseudomonas aeruginosa S122_C02_RS';
gca213.Taxonomy = 'gammaproteobacteria';
gca213.Genbank_Accession = 'GCA_002136245.1';
gca213.Csf2_fasta = 'gca213_csf2.fasta';
gca213.Location = 'unknown';
gca213.Fasta_g = 'gca213.fsa_nt';
gca213.Plasmid_blast = 'gca213.csv';

typeivs = [typeivs, gca213];

gca218 = bacterium;
gca218.ProteinID = 'WP_023100586';
gca218.Species = 'Pseudomonas aeruginosa HSV3483';
gca218.Taxonomy = 'gammaproteobacteria';
gca218.Genbank_Accession = 'GCA_002188625.1';
gca218.Csf2_fasta = 'gca218_csf2.fasta';
gca218.Location = 'unknown';
gca218.Fasta_g = 'gca218.fsa_nt';
gca218.Plasmid_blast = 'gca218.csv';

typeivs = [typeivs, gca218];

gca232 = bacterium;
gca232.ProteinID = 'WP_023100586';
gca232.Species = 'Pseudomonas aeruginosa env172';
gca232.Taxonomy = 'gammaproteobacteria';
gca232.Genbank_Accession = 'GCA_002326435.1';
gca232.Csf2_fasta = 'gca232_csf2.fasta';
gca232.Location = 'unknown';
gca232.Fasta_g = 'gca232.fsa_nt';
gca232.Plasmid_blast = 'gca232.csv';

typeivs = [typeivs, gca232];

gca233 = bacterium;
gca233.ProteinID = 'WP_023100586';
gca233.Species = 'Pseudomonas aeruginosa env408';
gca233.Taxonomy = 'gammaproteobacteria';
gca233.Genbank_Accession = 'GCA_002330505.1';
gca233.Csf2_fasta = 'gca233_csf2.fasta';
gca233.Location = 'unknown';
gca233.Fasta_g = 'gca233.fsa_nt';
gca233.Plasmid_blast = 'gca233.csv';

typeivs = [typeivs, gca233];

gca38 = bacterium;
gca38.ProteinID = 'WP_023100586';
gca38.Species = 'Pseudomonas aeruginosa PN586(35)w';
gca38.Taxonomy = 'gammaproteobacteria';
gca38.Genbank_Accession = 'GCA_003837665.1';
gca38.Csf2_fasta = 'gca38_csf2.fasta';
gca38.Location = 'unknown';
gca38.Fasta_g = 'gca38.fsa_nt';
gca38.Plasmid_blast = 'gca38.csv';

typeivs = [typeivs, gca38];

gca23 = bacterium;
gca23.ProteinID = 'WP_023100586';
gca23.Species = 'Pseudomonas aeruginosa ICBBVIM-2';
gca23.Taxonomy = 'gammaproteobacteria';
gca23.Genbank_Accession = 'GCA_002351435.1';
gca23.Csf2_fasta = 'gca23_csf2.fasta';
gca23.Location = 'unknown';
gca23.Fasta_g = 'gca23.fsa_nt';
gca23.Plasmid_blast = 'gca23.csv';

typeivs = [typeivs, gca23];

gca235 = bacterium;
gca235.ProteinID = 'WP_023100586';
gca235.Species = 'Pseudomonas aeruginosa ICBSVIM-2';
gca235.Taxonomy = 'gammaproteobacteria';
gca235.Genbank_Accession = 'GCA_002351425.1';
gca235.Csf2_fasta = 'gca235_csf2.fasta';
gca235.Location = 'unknown';
gca235.Fasta_g = 'gca235.fsa_nt';
gca235.Plasmid_blast = 'gca235.csv';

typeivs = [typeivs, gca235];

gca33 = bacterium;
gca33.ProteinID = 'WP_023100586';
gca33.Species = 'Pseudomonas aeruginosa AR_0241';
gca33.Taxonomy = 'gammaproteobacteria';
gca33.Genbank_Accession = 'GCA_003324405.1';
gca33.Csf2_fasta = 'gca33_csf2.fasta';
gca33.Location = 'unknown';
gca33.Fasta_g = 'gca33.fsa_nt';
gca33.Plasmid_blast = 'gca33.csv';

typeivs = [typeivs, gca33];

gca332 = bacterium;
gca332.ProteinID = 'WP_023100586';
gca332.Species = 'Pseudomonas aeruginosa I1-408';
gca332.Taxonomy = 'gammaproteobacteria';
gca332.Genbank_Accession = 'GCA_003325715.1';
gca332.Csf2_fasta = 'gca332_csf2.fasta';
gca332.Location = 'unknown';
gca332.Fasta_g = 'gca332.fsa_nt';
gca332.Plasmid_blast = 'gca332.csv';

typeivs = [typeivs, gca332];

gca3325 = bacterium;
gca3325.ProteinID = 'WP_023100586';
gca3325.Species = 'Pseudomonas aeruginosa G1-402';
gca3325.Taxonomy = 'gammaproteobacteria';
gca3325.Genbank_Accession = 'GCA_003325515.1';
gca3325.Csf2_fasta = 'gca3325_csf2.fasta';
gca3325.Location = 'unknown';
gca3325.Fasta_g = 'gca3325.fsa_nt';
gca3325.Plasmid_blast = 'gca3325.csv';

typeivs = [typeivs, gca3325];

gca34 = bacterium;
gca34.ProteinID = 'WP_023100586';
gca34.Species = 'Pseudomonas aeruginosa PABL064';
gca34.Taxonomy = 'gammaproteobacteria';
gca34.Genbank_Accession = 'GCA_003411475.1';
gca34.Csf2_fasta = 'gca34_csf2.fasta';
gca34.Location = 'unknown';
gca34.Fasta_g = 'gca34.fsa_nt';
gca34.Plasmid_blast = 'gca34.csv';

typeivs = [typeivs, gca34];

gca36 = bacterium;
gca36.ProteinID = 'WP_023100586';
gca36.Species = 'Pseudomonas aeruginosa VET-31';
gca36.Taxonomy = 'gammaproteobacteria';
gca36.Genbank_Accession = 'GCA_003632965.1';
gca36.Csf2_fasta = 'gca36_csf2.fasta';
gca36.Location = 'unknown';
gca36.Fasta_g = 'gca36.fsa_nt';
gca36.Plasmid_blast = 'gca36.csv';

typeivs = [typeivs, gca36];

gca362 = bacterium;
gca362.ProteinID = 'WP_023100586';
gca362.Species = 'Pseudomonas aeruginosa HUM-339';
gca362.Taxonomy = 'gammaproteobacteria';
gca362.Genbank_Accession = 'GCA_003628905.1';
gca362.Csf2_fasta = 'gca363_csf2.fasta';
gca362.Location = 'unknown';
gca362.Fasta_g = 'gca362.fsa_nt';
gca362.Plasmid_blast = 'gca362.csv';              

typeivs = [typeivs, gca362];

gca396 = bacterium;
gca396.ProteinID = 'WP_023100586';
gca396.Species = 'Pseudomonas aeruginosa MRSN8915';
gca396.Taxonomy = 'gammaproteobacteria';
gca396.Genbank_Accession = 'GCA_003968025.1';
gca396.Csf2_fasta = 'gca396_csf2.fasta';
gca396.Location = 'unknown';
gca396.Fasta_g = 'gca396.fsa_nt';
gca396.Plasmid_blast = 'gca396.csv';

typeivs = [typeivs, gca396];

gca43 = bacterium;
gca43.ProteinID = 'WP_023100586';
gca43.Species = 'Pseudomonas aeruginosa 153';
gca43.Taxonomy = 'gammaproteobacteria';
gca43.Genbank_Accession = 'GCA_004350055.1';
gca43.Csf2_fasta = 'gca43_csf2.fasta';
gca43.Location = 'unknown';
gca43.Fasta_g = 'gca43.fsa_nt';
gca43.Plasmid_blast = 'gca43.csv';

typeivs = [typeivs, gca43];

gca67 = bacterium;
gca67.ProteinID = 'WP_023100586';
gca67.Species = 'Pseudomonas aeruginosa BWH031';
gca67.Taxonomy = 'gammaproteobacteria';
gca67.Genbank_Accession = 'GCA_006704785.1';
gca67.Csf2_fasta = 'gca67_csf2.fasta';
gca67.Location = 'unknown';
gca67.Fasta_g = 'gca67.fsa_nt';
gca67.Plasmid_blast = 'gca67.csv';

typeivs = [typeivs, gca67];

gca670 = bacterium;
gca670.ProteinID = 'WP_023100586';
gca670.Species = 'Pseudomonas aeruginosa PASP199';
gca670.Taxonomy = 'gammaproteobacteria';
gca670.Genbank_Accession = 'GCA_006704945.1';
gca670.Csf2_fasta = 'gca670_csf2.fasta';
gca670.Location = 'unknown';
gca670.Fasta_g = 'gca670.fsa_nt';
gca670.Plasmid_blast = 'gca670.csv';

typeivs = [typeivs, gca670];

gca6704 = bacterium;
gca6704.ProteinID = 'WP_023100586';
gca6704.Species = 'Pseudomonas aeruginosa PASP174';
gca6704.Taxonomy = 'gammaproteobacteria';
gca6704.Genbank_Accession = 'GCA_006704955.1';
gca6704.Csf2_fasta = 'gca6704_csf2.fasta';
gca6704.Location = 'unknown';
gca6704.Fasta_g = 'gca6704.fsa_nt';
gca6704.Plasmid_blast = 'gca6704.csv';

typeivs = [typeivs, gca6704];

gca88 = bacterium;
gca88.ProteinID = 'WP_023100586';
gca88.Species = 'Pseudomonas aeruginosa KCJ3K10';
gca88.Taxonomy = 'gammaproteobacteria';
gca88.Genbank_Accession = 'GCA_008802475.1';
gca88.Csf2_fasta = 'gca88_csf2.fasta';
gca88.Location = 'unknown';
gca88.Fasta_g = 'gca88.fsa_nt';
gca88.Plasmid_blast = 'gca88.csv';

typeivs = [typeivs, gca88];

gca15 = bacterium;
gca15.ProteinID = 'WP_023100586';
gca15.Species = 'Pseudomonas aeruginosa SPA01';
gca15.Taxonomy = 'gammaproteobacteria';
gca15.Genbank_Accession = 'GCA_001535675..1';
gca15.Csf2_fasta = 'gca15_csf2.fasta';
gca15.Location = 'unknown';
gca15.Fasta_g = 'gca15.fsa_nt';
gca15.Plasmid_blast = 'gca15.csv';

typeivs = [typeivs, gca15];

gca3 = bacterium;
gca3.ProteinID = 'RCI72788';
gca3.Species = 'Pseudomonas aeruginosa B2-305';
gca3.Taxonomy = 'gammaproteobacteria';
gca3.Genbank_Accession = 'GCA_003325605.1';
gca3.Csf2_fasta = 'gca2_csf2.fasta';
gca3.Location = 'unknown';
gca3.Fasta_g = 'gca3.fsa_nt';
gca3.Plasmid_blast = 'gca3.csv';

typeivs = [typeivs, gca3];

gca22 = bacterium;
gca22.ProteinID = 'WP_088922487';
gca22.Species = 'Pseudomonas aeruginosa PA83';
gca22.Taxonomy = 'gammaproteobacteria';
gca22.Genbank_Accession = 'GCA_002215345.1';
gca22.Csf2_fasta = 'gca22_csf2.fasta';
gca22.Location = 'plasmid';
gca22.Fasta_g = 'gca22_g.fasta';
gca22.Fasta_p1 = 'gca22_p1.fasta';
gca22.crispr = 1;
gca22.othercrispr = 1;
gca22.unknown = 2;
gca22.genomic = 0;
gca22.plasmid = 0;
gca22.viral = 0;
gca22.recd = 0;
gca22.ding = 0;
gca22.cas1 = 0;
gca22.cas2 = 0;
gca22.cas3 = 0;
gca22.cas10 = 0;

typeivs = [typeivs, gca22];

gcf2 = bacterium;
gcf2.ProteinID = 'WP_011254653';
gcf2.Species = 'Aromatoleum aromaticum EbN1';
gcf2.Taxonomy = 'betaproteobacteria';
gcf2.Genbank_Accession = 'GCA_000025965.1';
gcf2.Csf2_fasta = 'gcf2_csf2.fasta';
gcf2.Location = 'plasmid';
gcf2.Fasta_g = 'gcf2_g.fasta';
gcf2.Fasta_p1 = 'gcf2_p1.fasta';
gcf2.Fasta_p1 = 'gcf2_p2.fasta';
gcf2.crispr = 1;
gcf2.othercrispr = 1;
gcf2.plasmid = 1;
gcf2.unknown = 21;
gcf2.genomic = 0;
gcf2.viral = 0;
gcf2.cas2 = 0;
gcf2.cas1 = 0;
gcf2.ding = 0;
gcf2.recd = 0;
gcf2.cas3 = 0;
gcf2.cas10 = 0;

typeivs = [typeivs, gcf2];

gca7 = bacterium;
gca7.ProteinID = 'WP_034032558';
gca7.Species = 'Pseudomonas aeruginosa AZPAE14453';
gca7.Taxonomy = 'gammaproteobacteria';
gca7.Genbank_Accession = 'GCA_000796345.1';
gca7.Csf2_fasta = 'gca7_csf2.fasta';
gca7.Location = 'unknown';
gca7.Fasta_g = 'gca7.fsa_nt';
gca7.Plasmid_blast = 'gca7.csv';

typeivs = [typeivs, gca7];

gca02 = bacterium;
gca02.ProteinID = 'WP_086230849';
gca02.Species = 'Pseudomonas aeruginosa S742_C15_BS';
gca02.Taxonomy = 'gammaproteobacteria';
gca02.Genbank_Accession = 'GCA_002135805.1';
gca02.Csf2_fasta = 'gca02_csf2.fasta';
gca02.Location = 'unknown';
gca02.Fasta_g = 'gca02.fsa_nt';
gca02.Plasmid_blast = 'gca02.csv';

typeivs = [typeivs, gca02];

gca11 = bacterium;
gca11.ProteinID = 'WP_050412963';
gca11.Species = 'Pseudomonas aeruginosa P40_Scotland_4_VIM_2_09_12';
gca11.Taxonomy = 'gammaproteobacteria';
gca11.Genbank_Accession = 'GCA_001181205.1';
gca11.Csf2_fasta = 'gca11_csf2.fasta';
gca11.Location = 'unknown';
gca11.Fasta_g = 'gca11.fsa_nt';
gca11.Plasmid_blast = 'gca11.csv';

typeivs = [typeivs, gca11];

gca223 = bacterium;
gca223.ProteinID = 'WP_093971896';
gca223.Species = 'Pusillimonas sp. T2';
gca223.Taxonomy = 'betaproteobacteria';
gca223.Genbank_Accession = 'GCA_002236805.1';
gca223.Csf2_fasta = 'gca223_csf2.fasta';
gca223.Location = 'unknown';
gca223.Fasta_g = 'gca223.fsa_nt';
gca223.Plasmid_blast = 'gca223.csv';

typeivs = [typeivs, gca223];

gca9 = bacterium;
gca9.ProteinID = 'WP_115284752';
gca9.Species = 'Pseudomonas aeruginosa NCTC13719';
gca9.Taxonomy = 'gammaproteobacteria';
gca9.Genbank_Accession = 'GCA_900455415.1';
gca9.Csf2_fasta = 'gca9_csf2.fasta';
gca9.Location = 'unknown';
gca9.Fasta_g = 'gca9.fsa_nt';
gca9.Plasmid_blast = 'gca9.csv';

typeivs = [typeivs, gca9];

gca900 = bacterium;
gca900.ProteinID = 'WP_115284752';
gca900.Species = 'Pseudomonas aeruginosa NCTC13437';
gca900.Taxonomy = 'gammaproteobacteria';
gca900.Genbank_Accession = 'GCA_900706955.1';
gca900.Csf2_fasta = 'gca900_csf2.fasta';
gca900.Location = 'unknown';
gca900.Fasta_g = 'gca900.fsa_nt';
gca900.Plasmid_blast = 'gca900.csv';

typeivs = [typeivs, gca900];

gca17 = bacterium;

gca17.ProteinID = 'WP_079863219';
gca17.Species = 'Pseudomonas aeruginosa HPA 4';
gca17.Taxonomy = 'gammaproteobacteria';
gca17.Genbank_Accession = 'GCA_001756585.1';
gca17.Csf2_fasta = 'gca17_csf2.fasta';
gca17.Location = 'unknown';
gca17.Fasta_g = 'gca17.fsa_nt';
gca17.Plasmid_blast = 'gca17.csv';

typeivs = [typeivs, gca17];

gca37 = bacterium;
gca37.ProteinID = 'WP_026300949';
gca37.Species = 'Thioalkalivibrio sp. ALE23';
gca37.Taxonomy = 'gammaproteobacteria';
gca37.Genbank_Accession = 'GCA_000378545.1';
gca37.Csf2_fasta = 'gca37_csf2.fasta';
gca37.Location = 'unknown';
gca37.Fasta_g = 'gca37.fsa_nt';
gca37.Plasmid_blast = 'gca37.csv';

typeivs = [typeivs, gca37];

gca92 = bacterium;
gca92.ProteinID = 'WP_152740544';
gca92.Species = 'Pseudomonas sp. MWU12-2323';
gca92.Taxonomy = 'gammaproteobacteria';
gca92.Genbank_Accession = 'GCA_009295765.1';
gca92.Csf2_fasta = 'gca92_csf2.fasta';
gca92.Location = 'unknown';
gca92.Fasta_g = 'gca92.fsa_nt';
gca92.Plasmid_blast = 'gca92.csv';


typeivs = [typeivs, gca92];

gca188 = bacterium;
gca188.ProteinID = 'APE04166';
gca188.Species = 'Alteromonas mediterranea RG65';
gca188.Taxonomy = 'gammaproteobacteria';
gca188.Genbank_Accession = 'GCA_001886435.1';
gca188.Csf2_fasta = 'gca188_csf2.fasta';
gca188.Location = 'plasmid';
gca188.Fasta_g = 'gca188_g.fasta';
gca188.Fasta_p1 = 'gca188_p1.fasta';
gca188.crispr = 1;
gca188.othercrispr = 1;
gca188.unknown = 7;
gca188.plasmid = 0;
gca188.genomic = 0;
gca188.viral = 0;
gca188.recd = 1;
gca188.ding = 0;
gca188.cas1 = 0;
gca188.cas2 = 0;
gca188.cas3 = 0;
gca188.cas10 = 0;

typeivs = [typeivs, gca188];

gca03 = bacterium;
gca03.ProteinID = 'MAB91400';
gca03.Species = 'Pseudoalteromonas sp. isolate UBA11876';
gca03.Taxonomy = 'gammaproteobacteria';
gca03.Genbank_Accession = 'GCA_003541095.1';
gca03.Csf2_fasta = 'gca03_csf2.fasta';
gca03.Location = 'unknown';
gca03.Fasta_g = 'gca03.fsa_nt';
gca03.Plasmid_blast = 'gca03.csv';

typeivs = [typeivs, gca03];

gca18 = bacterium;
gca18.ProteinID = 'WP_081367604';
gca18.Species = 'Alteromonas mediterranea RG65';
gca18.Taxonomy = 'gammaproteobacteria';
gca18.Genbank_Accession = 'GCA_001886435.1';
gca18.Csf2_fasta = 'gca18_csf2.fasta';
gca18.Location = 'plasmid';
gca18.Fasta_g = 'gca18_g.fasta';
gca18.Fasta_p1 = 'gca18_p1.fasta';
gca18.crispr = 1;
gca18.othercrispr = 1;
gca18.unknown = 7;
gca18.plasmid = 0;
gca18.genomic = 0;
gca18.viral = 0;
gca18.cas1 = 0;
gca18.cas2 = 0;
gca18.ding = 0;
gca18.recd = 1;
gca18.cas3 = 0;
gca18.cas10 = 0;

typeivs = [typeivs, gca18];

gca9001 = bacterium;
gca9001.ProteinID = 'WP_092942380';
gca9001.Species = 'Acidovorax wautersii DSM 27981';
gca9001.Taxonomy = 'betaproteobacteria';
gca9001.Genbank_Accession = 'GCA_900113035.1';
gca9001.Csf2_fasta = 'gca9001_csf2.fasta';
gca9001.Location = 'unknown';
gca9001.Fasta_g = 'gca9001.fsa_nt';
gca9001.Plasmid_blast = 'gca9001.csv';

typeivs = [typeivs, gca9001];

gca036 = bacterium;
gca036.ProteinID = 'RMH36420';
gca036.Species = 'Gammaproteobacteria bacterium isolate J021';
gca036.Taxonomy = 'gammaproteobacteria';
gca036.Genbank_Accession = 'GCA_003696665.1';
gca036.Csf2_fasta = 'gca036_csf2.fasta';
gca036.Location = 'unknown';
gca036.Fasta_g = 'gca036.fsa_nt';
gca036.Plasmid_blast = 'gca036.csv';

typeivs = [typeivs, gca036];
%% generate list of type iv plasmids


plasmids = {};
pcount = 1;
[xx,yy] = size(typeivs);
for ii = 1:yy
   if strcmp(typeivs(1,ii).Location,'plasmid')
       plasmids{pcount} = typeivs(1,ii).Fasta_p1;
       pcount = pcount + 1;
   end
end
[xp,yp] = size(plasmids);
length_matrix = zeros(1,yp);
fid = fopen('plasmids.fasta','wt');
for pp = 1:yp
    file = fopen(plasmids{1,pp},'r');
    line1 = fgetl(file);
    q = 1; % counts lines
    while line1 ~= -1
        if line1(1) == '>'
            fprintf(fid,'\n');
            fprintf(fid,line1);
            fprintf(fid,'\n');
        else
            fprintf(fid,line1);
            length_matrix(1,pp) = length_matrix(1,pp) + length(line1);
        end
        line1 = fgetl(file);
        q = q + 1;
    end
end
yp
pmean = mean(length_matrix)
error = std(length_matrix)/(sqrt(yp))
fclose(fid);
blastformat('Inputdb','plasmids.fasta','FormatPath','C:\Program Files\Blast\bin\formatdb.exe','Title','plasmid_db','protein','false');

%% theoretical way to determine if contigs are "hits" of type iv plasmids
% this method was discarded due to computing limits of computer
% it was much quicker to use the web interface and generate a report
[xx,yy] = size(typeivs);
for ii = 1:yy
    if strcmp(typeivs(1,ii).Location,'unknown')
        disp(ii)
        contigs = gcf41.findtypeivplasmids();
    end
end
%% for unknown locations, determine if they are plasmid or genomic based on if contigs are 
% hits of plasmids, then separates into two fastas = type iv plasmid hits
% and non-type iv plasmid hits, classified as genomic
[xx,yy] = size(typeivs);
for ii = 1:yy
    if strcmp(typeivs(1,ii).Location,'unknown')
        [typeivs(1,ii).Fasta_g,typeivs(1,ii).Fasta_p1,typeivs(1,ii).Location] = typeivs(1,ii).separateplasmids();
    end
end
%% generate list of files to perform CRISPRCasFinder on
crisprfiles = fopen('crisprfiles.txt','wt');
[xx,yy] = size(typeivs);
for ii = 1:yy
    if strcmp(typeivs(1,ii).Location,'plasmid')
        fprintf(crisprfiles,sprintf('%s \t %s \n',typeivs(1,ii).Species,typeivs(1,ii).Fasta_p1));
    else    
        fprintf(crisprfiles,sprintf('%s \t %s \n',typeivs(1,ii).Species,typeivs(1,ii).Fasta_g));
    end
end
fclose(crisprfiles);
%% determine number of times each protein appears and total number of proteins
[xx,yy] = size(typeivs);
disp(yy)
proteins = {};
for ii = 1:yy
    proteins{ii} = typeivs(1,ii).ProteinID;
end
uniquep = unique(proteins);
[ux,uy] = size(uniquep);
disp(uy)
%% determine classes of organisms
[xx,yy] = size(typeivs);
classes = {};
for ii = 1:yy
    classes{ii} = typeivs(1,ii).Taxonomy;
end
uniquec = unique(classes);
[ux,uy] = size(uniquec);
classcount = zeros(1,uy);
for jj = 1:uy
    for pp = 1:yy
       if strcmp(classes{pp},uniquec{jj})
          classcount(1,jj) =  classcount(1,jj) +1;
       end
    end
end
figure;
pie(classcount);
legend(uniquec);
%% get genus distribution
[xx,yy] = size(typeivs);
genus = {};
for ii = 1:yy
    x = strsplit(typeivs(1,ii).Species);
    genus{ii} = x{1};
end
uniqueg = unique(genus);
[ux,uy] = size(uniqueg);
classcount = zeros(1,uy);
for jj = 1:uy
    for pp = 1:yy
       if strcmp(genus{pp},uniqueg{jj})
          classcount(1,jj) =  classcount(1,jj) +1;
       end
    end
end
B = categorical(genus,uniqueg);
C = categorical(transpose(categories(B)));
figure;
bar(C,sort(classcount,'descend'));
%% determine number of times each protein appears and total number of proteins
[xx,yy] = size(typeivs);
disp(yy)
proteins = {};
for ii = 1:yy
    proteins{ii} = typeivs(1,ii).ProteinID;
end
uniquep = unique(proteins);
[ux,uy] = size(uniquep);
disp(uy)
%% determine classes of organisms
[xx,yy] = size(typeivs);
loc = {};
for ii = 1:yy
    loc{ii} = typeivs(1,ii).Location;
end
uniquel = unique(loc);
[ux,uy] = size(uniquel);
classcount = zeros(1,uy);
for jj = 1:uy
    for pp = 1:yy
       if strcmp(loc{pp},uniquel{jj})
          classcount(1,jj) =  classcount(1,jj) +1;
       end
    end
end
figure;
pie(classcount);
legend(uniquel);
%% determine classifications of "unknown"
gen = 0;
plas = 0;
[xx,yy] = size(typeivs);
for ii = 1:yy
    if strcmp(typeivs(1,ii).Location,'unknown')
       if isempty(typeivs(1,ii).Plasmid_blast)
           gen = gen + 1;
       else
           plas = plas + 1;
       end
    end
end
figure;
pie([gen plas]);
legend({'No TypeIV CRISPR Plasmid Homologs Found','TypeIV CRISPR Plasmid Homologs Found'});
%% reclassify sample based on no WGS
[xx,yy] = size(typeivs);
proteins = {};
genus = {};
classes = {};
num = 1;
for ii = 1:yy
    if ~strcmp(typeivs(1,ii).Location,'unknown')
        proteins{num} = typeivs(1,ii).ProteinID;
        classes{num} = typeivs(1,ii).Taxonomy;
        x = strsplit(typeivs(1,ii).Species);
        genus{num} = x{1};
        num = num + 1;
    end
end

[xp,yp] = size(proteins)
uniquep = unique(proteins);
[ux,uy] = size(uniquep);
disp(uy)

uniquec = unique(classes);
[ux,uy] = size(uniquec);
classcount = zeros(1,uy);
for jj = 1:uy
    for pp = 1:yp
       if strcmp(classes{pp},uniquec{jj})
          classcount(1,jj) =  classcount(1,jj) +1;
       end
    end
end
figure;
pie(classcount);
legend(uniquec);

uniqueg = unique(genus);
[ux,uy] = size(uniqueg);
classcount = zeros(1,uy);
for jj = 1:uy
    for pp = 1:yp
       if strcmp(genus{pp},uniqueg{jj})
          classcount(1,jj) =  classcount(1,jj) +1;
       end
    end
end
B = categorical(genus,uniqueg);
C = categorical(transpose(categories(B)));
figure;
bar(C,sort(classcount,'descend'));
%% get percent of recognizable targets
[xx,yy] = size(typeivs);

unknown = 0;
plasmid = 0;
genomic = 0;
viral = 0;

for ii = 1:yy
    if ~strcmp(typeivs(1,ii).Location,'unknown')
        unknown = typeivs(1,ii).unknown + unknown;
        plasmid = typeivs(1,ii).plasmid + plasmid;
        genomic = typeivs(1,ii).genomic + genomic;
        viral = typeivs(1,ii).viral + viral;
    end
end
plasmid
genomic
figure;
pie([unknown plasmid genomic viral]);
legend({'Unknown','Plasmid','Genomic','Viral'});
%% analysis of type iv crispr extended system
[xx,yy] = size(typeivs);

othercrisprp = [];
noothercrisprp = [];
othercrisprg = [];
noothercrisprg = [];
othercrispru = [];
noothercrispru = [];

dingp = [];
recdp = [];
nohelicasep = [];
dingg = [];
recdg = [];
nohelicaseg = [];
dingu = [];
recdu = [];
nohelicaseu = [];

cas3p = [];
nocas3p = [];
cas3g = [];
nocas3g = [];
cas3u = [];
nocas3u = [];

for ii = 1:yy
    if strcmp(typeivs(1,ii).Location,'plasmid')
        total = typeivs(1,ii).plasmid + typeivs(1,ii).genomic + typeivs(1,ii).unknown; 
        if typeivs(1,ii).othercrispr == 1
            othercrisprp = [othercrisprp typeivs(1,ii).plasmid/total];
            othercrisprg = [othercrisprg typeivs(1,ii).genomic/total];
            othercrispru = [othercrispru typeivs(1,ii).unknown/total];
        else
            noothercrisprp = [noothercrisprp typeivs(1,ii).plasmid/total];
            noothercrisprg = [noothercrisprg typeivs(1,ii).genomic/total];
            noothercrispru = [noothercrispru typeivs(1,ii).unknown/total];
        end
        if typeivs(1,ii).recd == 1
            dingp = [dingp typeivs(1,ii).plasmid/total];
            dingg = [dingg typeivs(1,ii).genomic/total];
            dingu = [dingu typeivs(1,ii).unknown/total];
        elseif typeivs(1,ii).ding == 1    
            recdp = [recdp typeivs(1,ii).plasmid/total];
            recdg = [recdg typeivs(1,ii).genomic/total];
            recdu = [recdu typeivs(1,ii).unknown/total];
        else
            nohelicasep = [nohelicasep typeivs(1,ii).plasmid/total];
            nohelicaseg = [nohelicaseg typeivs(1,ii).genomic/total];
            nohelicaseu = [nohelicaseu typeivs(1,ii).unknown/total];
        end  
        if typeivs(1,ii).cas3 == 1
           cas3p = [cas3p typeivs(1,ii).plasmid/total];
            cas3g = [cas3g typeivs(1,ii).genomic/total];
            cas3u = [cas3u typeivs(1,ii).unknown/total];
        else
            nocas3p = [nocas3p typeivs(1,ii).plasmid/total];
            nocas3g = [nocas3g typeivs(1,ii).genomic/total];
            nocas3u = [nocas3u typeivs(1,ii).unknown/total];
        end
    end
end
[x,otherc] = size(othercrisprp);
[x,nootherc] = size(noothercrisprp);
[x,recds] = size(recdp);
[x,dings] = size(dingp);
[x,nohel] = size(nohelicasep);
[x,cas3s] = size(cas3p);
[x,nocas3s] = size(nocas3p);
%% generate figures for other crispr
figure;
y = [mean(othercrisprp) mean(othercrisprg) mean(othercrispru);mean(noothercrisprp) mean(noothercrisprg) mean(noothercrispru)];
xx = categorical({'Genomic CRISPR Cassette','No Genomic CRISPR Cassette'});
ngroups = size(y,1);
nbars = size(y,2);
error = [std(othercrisprp)/sqrt(length(othercrisprp)) std(othercrisprg)/sqrt(length(othercrisprg)) std(othercrispru)/sqrt(length(othercrispru)); 0 0 0 ];
bar(y); hold on;
groupwidth = min(0.8,nbars/(nbars+1.5));
for i = 1:nbars
   x = (1:ngroups) - groupwidth/2 + (2*i-1)*groupwidth/(2*nbars);
   errorbar(x,y(:,i),error(:,i),'.');
end
set(gca,'XTickLabel',xx);
error = [std(othercrisprp)/sqrt(length(othercrisprp)) std(othercrisprg)/sqrt(length(othercrisprg)) std(othercrispru)/sqrt(length(othercrispru)); 0 0 0 ]
legend({'Plasmid','Genomic','Unknown'});
hold off
%%
figure;
y = [mean(recdp) mean(recdg) mean(recdu);mean(dingp) mean(dingg) mean(dingu);mean(nohelicasep) mean(nohelicaseg) mean(nohelicaseu)];
xx = categorical({'RecD','DinG','No Helicase'});
ngroups = size(y,1);
nbars = size(y,2);
error = [std(recdp)/sqrt(length(recdp)) std(recdg)/sqrt(length(recdg)) std(recdu)/sqrt(length(recdu)); std(dingp)/sqrt(length(dingp)) std(dingg)/sqrt(length(dingg)) std(dingu)/sqrt(length(dingu));std(nohelicasep)/sqrt(length(nohelicasep)) std(nohelicaseg)/sqrt(length(nohelicaseg)) std(nohelicaseu)/sqrt(length(nohelicaseu))];
bar(y); hold on;
groupwidth = min(0.8,nbars/(nbars+1.5));
for i = 1:nbars
   x = (1:ngroups) - groupwidth/2 + (2*i-1)*groupwidth/(2*nbars);
   errorbar(x,y(:,i),error(:,i),'.');
end
set(gca,'XTickLabel',xx);
error = [std(othercrisprp)/sqrt(length(othercrisprp)) std(othercrisprg)/sqrt(length(othercrisprg)) std(othercrispru)/sqrt(length(othercrispru)); 0 0 0 ]
legend({'Plasmid','Genomic','Unknown'});
hold off
%%
[h,p_dandg_p] = ttest2(dingp,recdp)
[h,p_dandg_g] = ttest2(dingg,recdg)
[h,p_dandg_u] = ttest2(dingu,recdu)

[h,p_dandn_p] = ttest2(dingp,nohelicasep)
[h,p_dandn_g] = ttest2(dingg,nohelicaseg)
[h,p_dandn_u] = ttest2(dingu,nohelicaseu)

[h,p_nandg_p] = ttest2(nohelicasep,recdp)
[h,p_nandg_g] = ttest2(nohelicaseg,recdg)
[h,p_nandg_u] = ttest2(nohelicaseu,recdu)
%%
figure;
y = [mean(nocas3p) mean(nocas3g) mean(nocas3u);mean(cas3p) mean(cas3g) mean(cas3u)];
xx = categorical({'No Genomic Cas3','Genomic Cas3'});
ngroups = size(y,1);
nbars = size(y,2);
error = [std(nocas3p)/sqrt(length(nocas3p)) std(nocas3g)/sqrt(length(nocas3g)) std(nocas3u)/sqrt(length(nocas3u)); 0 0 0 ];
bar(y); hold on;
groupwidth = min(0.8,nbars/(nbars+1.5));
for i = 1:nbars
   x = (1:ngroups) - groupwidth/2 + (2*i-1)*groupwidth/(2*nbars);
   errorbar(x,y(:,i),error(:,i),'.');
end
set(gca,'XTickLabel',xx);
error = [std(othercrisprp)/sqrt(length(othercrisprp)) std(othercrisprg)/sqrt(length(othercrisprg)) std(othercrispru)/sqrt(length(othercrispru)); 0 0 0 ]
legend({'Plasmid','Genomic','Unknown'});
hold off