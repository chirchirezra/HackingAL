report 50100 "Test Email Report"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = './Report/Report50100-TestEmailReport.docx';
    dataset
    {
        dataitem(Customer;Customer)
        {
            column(Name;Name)
            {
                
            }
        }
    }
    
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {

                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
    
    var
        myInt: Integer;
}