require 'nokogiri'

class Optima
  class OptimaXml

    def generate_xml(configuration, invoices)

      if invoices
        builder = Nokogiri::XML::Builder.new(:encoding => 'utf-8') do |xml|
          xml.ROOT({xmlns: "http://www.comarch.pl/cdn/optima/offline"}) {
            xml.REJESTRY_SPRZEDAZY_VAT {
              xml.WERSJA 2.00
              xml.BAZA_ZRD_ID "APP"
              xml.BAZA_DOC_ID configuration['baza_docelowa']

              invoices.each do |invoice|
                xml.REJESTR_SPRZEDAZY_VAT {
                  xml.ID_ZRODLA invoice.id
                  xml.MODUL configuration['modul']
                  xml.REJESTR configuration['rejestr']
                  xml.DATA_WYSTAWIENIA invoice['issue_date']
                  xml.DATA_SPRZEDAZY invoice['sale_date']
                  xml.TERMIN invoice['due_date']
                  xml.DATA_DATAOBOWIAZKUPODATKOWEGO invoice['sale_date']
                  xml.DATA_DATAPRAWAODLICZENIA invoice['sale_date']
                  xml.NUMER invoice['number']
                  xml.KOREKTA 'Nie'
                  xml.KOREKTA_NUMER
                  xml.WEWNETRZNA 'Nie'
                  xml.FISKALNA 'Nie'
                  xml.DETALICZNA 'Nie'
                  xml.EKSPORT 'nie' # sprzedaz krajowa
                  xml.FINALNY invoice['physical_person']
                  xml.PODATNIK_CZYNNY invoice['nip_available']
                  xml.TYP_PODMIOTU ['kontrahent']
                  xml.PODMIOT
                  xml.PODMIOT_ID
                  xml.NAZWA1
                  xml.NAZWA2
                  xml.NAZWA3
                  xml.NIP_KRAJ
                  xml.NIP
                  xml.KRAJ
                  xml.WOJEWODZTWO
                  xml.POWIAT
                  xml.GMINA
                  xml.ULICA
                  xml.NR_DOMU
                  xml.NR_LOKALU
                  xml.MIASTO
                  xml.KOD_POCZTOWY
                  xml.POCZTA
                  xml.DODATKOWE
                  xml.PESEL
                  xml.ROLNIK 'Nie'
                  xml.TYP_PLATNIKA 'kontrahent'
                  xml.TYP_PLATNIKA
                  xml.KATEGORIA configuration['kategoria']
                  xml.OPIS
                  xml.FORMA_PLATNOSCI invoice['payment_method']
                  xml.DEKLARACJA_VAT7 invoice['vat7_date']
                  xml.DEKLARACJA_VATUE invoice['vat_eu']
                  xml.WALUTA invoice['currency']
                  xml.KURS_WALUTY ['NBP']
                  xml.NOTOWANIE_WALUTY_ILE 1
                  xml.NOTOWANIE_WALUTY_ZA_ILE 1
                  xml.KURS_DO_KSIEGOWANIA 'Nie'
                  xml.KURS_WALUTY_2 'NBP'
                  xml.NOTOWANIE_WALUTY_ILE_2 1
                  xml.NOTOWANIE_WALUTY_ZA_ILE_2 1
                  xml.DATA_KURSU_2 invoice['sale_date']
                  xml.PLATNOSC_VAT_W_PLN 'Nie'
                  xml.AKCYZA_NA_WEGIEL 0
                  xml.AKCYZA_NA_WEGIEL_KOLUMNA_KPR 'nie księgować'
                  xml.ROLNIK

                  xml.POZYCJE {
                    invoice.invoice_lines.each do |line|
                      xml.POZYCJA {
                        xml.KATEGORIA_POS configuration['kategoria']
                        xml.STAWKA_VAT 23
                        xml.STATUS_VAT 'opodatkowana'
                        xml.NETTO line['price']
                        xml.VAT line['price']
                        xml.NETTO_SYS line['price']
                        xml.VAT_SYS line['price']
                        xml.NETTO_SYS2 line['price']
                        xml.VAT_SYS2 line['price']
                        xml.RODZAJ_SPRZEDAZY 'usługi'
                        xml.KOLUMNA_KPR 'Nie księgować'
                        xml.KOLUMNA_KPR 'Nie księgować'
                        xml.OPIS_POZ 'Nie księgować'
                      }
                    end
                  }

                  xml.KWOTY_DODATKOWE
                  xml.PLATNOSCI {
                    xml.PLATNOSC {
                      xml.ID_ŹRÓDLA_PLAT
                      xml.TERMIN_PLAT invoice['sale_date']
                      xml.FORMA_PLATNOSCI_PLAT 'Dotpay'
                      xml.FORMA_PLATNOSCI_ID_PLAT
                      xml.WALUTA_PLAT 'PLN'
                      xml.KURS_WALUTY_PLAT 'NBP'
                      xml.NOTOWANIE_WALUTY_ILE_PLAT 1
                      xml.NOTOWANIE_WALUTY_ZA_ILE_PLAT 1
                      xml.KWOTA_PLN_PLAT invoice['price']
                      xml.KIERUNEK 'przychód'
                      xml.PODLEGA_ROZLICZENIU 'Tak'
                      xml.KONTO 201
                      xml.DATA_KURSU_PLAT invoice['sale_date']
                      xml.WALUTA_DOK 'PLN'
                    }
                  }
                }
              end
            }
          }
        end

        builder.to_xml
      end
    end

    RODZAJ_EKSPORTU = {
        '' => Baza
    }

  end
end