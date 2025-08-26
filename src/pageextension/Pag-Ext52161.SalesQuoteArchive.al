pageextension 52161 "THK Sales Quote Archive" extends "Sales Quote Archive"
{
    actions
    {
        modify(Restore)
        {
            Visible = false;
        }
        addafter(Restore)
        {
            action("THK Restore")
            {
                ApplicationArea = Suite;
                Caption = 'Restore';
                Ellipsis = true;
                Image = Restore;
                ToolTip = 'Transfer the contents of this archived version to the original document.';

                trigger OnAction()
                var
                    ArchiveManagement: Codeunit ArchiveManagement;
                    SalesArchiveManagement: Codeunit "THK Sales Archive Management";
                begin
                    SalesArchiveManagement.RestoreSalesDocument(Rec);
                end;
            }
        }
        addafter(Restore_Promoted)
        {
            actionref("THK Restore_Promoted"; "THK Restore")
            {
            }
        }
    }
}
