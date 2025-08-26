pageextension 52100 "THK Job WIP G/L Entries" extends "Job WIP G/L Entries"
{
    actions
    {
        addlast("Ent&ry")
        {
            action("THK updateDimensionDivisionCode")
            {
                ApplicationArea = All;
                Caption = 'Update Dimension - Division Code';
                Ellipsis = true;
                Image = ChangeDimensions;
                ToolTip = 'This action will update the Division Code dimension.';

                trigger OnAction()
                var
                    JobWIPGLEntry: Record "Job WIP G/L Entry";
                begin
                    JobWIPGLEntry.reset;
                    JobWIPGLEntry.SetRange("Job No.", Rec."Job No.");
                    Report.RunModal(report::"Update Div. Dim. On ob WIP G/L", true, false, JobWIPGLEntry);
                end;
            }
        }
    }
}
