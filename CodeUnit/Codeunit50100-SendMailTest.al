codeunit 50100 "EmailSender"
{
    trigger OnRun()
    begin

    end;

    var
        Email: Codeunit Email;
        TempEmail: Record "Email Item" temporary;
        EmailMessage: Codeunit "Email Message";
        Instr: InStream;
        Oustr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        BigText: BigText;
        RecRef: RecordRef;
        BodyTxt: Text;



    procedure SendCustomerEmail(customer: Record Customer)
    var
        EmailSceanrio: Enum "Email Scenario";
    begin
        Clear(EmailMessage);
        Clear(TempBlob);
        Clear(RecRef);
        if RecRef.Get(customer.RecordId) then;
        TempBlob.CreateOutStream(Oustr);
        Report.SaveAs(Report::"Test Email Report", '', ReportFormat::Html, Oustr, RecRef);
        TempBlob.CreateInStream(Instr);
        // Instr.ReadText(BodyTxt);
        BigText.Read(Instr);
        BodyTxt := Format(BigText);

        Clear(TempBlob);
        TempBlob.CreateOutStream(Oustr);
        Report.SaveAs(Report::"Test Email Report", '', ReportFormat::Pdf, Oustr, RecRef);
        TempBlob.CreateInStream(Instr);

        EmailMessage.Create('ezra.chirchir@agilebiz.co.ke', 'TEST EMAIL', BodyTxt,true);
        EmailMessage.AddAttachment('CustomerReport.pdf', 'pdf', Base64Convert.ToBase64(Instr));
        Email.Enqueue(EmailMessage);

        /*
        TempEmail.Init();
        TempEmail."Send to":='ezra.chirchir@agilebiz.co.ke';
        TempEmail.Subject:='TEST EMAIL';
        TempEmail.Body.CreateOutStream(Oustr);
        Report.SaveAs(Report::"Test Email Report",'',ReportFormat::Html,Oustr,RecRef);
        TempEmail.Body.CreateInStream(Instr);
                BigText.Read(Instr);
        BodyTxt:=Format(BigText);
        Message(BodyTxt);
        TempEmail.AddAttachment(Instr,'Test Email.pdf');
        TempEmail.Validate("Plaintext Formatted",false);
        TempEmail.Send(true,EmailSceanrio::Default);
        */

    end;
}