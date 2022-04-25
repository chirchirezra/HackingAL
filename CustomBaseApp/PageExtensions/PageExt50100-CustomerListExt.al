pageextension 50100 CustomerListExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(processing)
        {
            action("Test Email Codeunit")
            {
                Image = MailAttachment;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    MailExt: Codeunit EmailSender;
                begin
                    MailExt.SendCustomerEmail(Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}