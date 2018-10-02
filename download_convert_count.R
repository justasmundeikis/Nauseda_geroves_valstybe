#reikalingi paketai
library(pdftools)
library(RCurl)

#sukuriamas sąrašas visų .pdf failų adresų
urls <- c(      "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/65_LMA1.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/64_LMA2.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/63_LMA3.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/62_LMA4.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/61_LMA5.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/60_LMA6.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/59_LMA7.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/58_LMA8.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/57_LMA9.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/56_LMA10.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/55_LMA11.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/112_LMA12.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/66_LMA13.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/67_LMA14.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/81_LMA15.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/1018_lma16.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/82_Makro_17.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/84_Makro_18.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/85_lma19.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/86_lma20.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/87_lma21.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/88_lma22.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/89_lma23.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/92_lma24.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/91_lma25.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/93_LMA26.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/94_LMA27.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/95_LMA28.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/102_LMA_Nr29.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/96_LMA_Nr30.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/97_LMA31.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/98_LMA32.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/99_LMA33.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/100_LMA34.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/101_LMA35.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/103_LMA36.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/104_LMA37.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/111_LMA38.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/39_LMA39.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/210_LMA40.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/565_LMA41.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/776_LMA42.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/1080_LMA43.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/1340_LMA44.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/1596_LMA45.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/1810_LMA46.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/1999_LMA47.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/2155_LMA48.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/2278_LMA49.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/2414_LMA50.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/2530_LMA51.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma52.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma53.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma54.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma55.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma56.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma57.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma58.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma59.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma_60.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma_61.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma_62.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma_63.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma_64.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma_65.pdf",
                "https://www.seb.lt/sites/default/files/web/document/lietuvos_makroekonomikos_apzvalga/lma_66.pdf")

#atsiunčiami visi urls sąraše esantys .pdf failai
for (i in seq_along(urls)) {download.file(urls[i], paste(getwd(), "/", i,".pdf", sep = ""))}

# sudaromas .pdf failų sąrašas
files <- list.files(pattern = "pdf$")

# nuskaitomi visi failai, o pdf failuose esantis tekstas apjungiamas į viena tekstinį dokumentą "master.txt"
for (i in seq_along(files)) {
        cat(pdf_text(files[i]), "\n", file = "master.txt", append = TRUE )
        }

#nuskaitomas "master.txt" dokumentas
master_file <- readLines("/home/pc/D/projects/seb/master.txt")

#suskaičiauojama, kiek kartu aptinkamas regex "gerovės valstyb.."
sum(grepl("gerovės valstyb..", master_file))
