page 50001 "THK Planning Component"
{
    ApplicationArea = All;
    Caption = 'Planning Component';
    PageType = List;
    SourceTable = "Planning Component";
    UsageCategory = Lists;
    Permissions = tabledata "Planning Component"=rmid;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Worksheet Template Name"; Rec."Worksheet Template Name")
                {
                    ToolTip = 'Specifies the value of the Worksheet Template Name field.';
                }
                field("Worksheet Batch Name"; Rec."Worksheet Batch Name")
                {
                    ToolTip = 'Specifies the value of the Worksheet Batch Name field.';
                }
                field("Worksheet Line No."; Rec."Worksheet Line No.")
                {
                    ToolTip = 'Specifies the value of the Worksheet Line No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the item number of the component.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the description of the component.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Position; Rec.Position)
                {
                    ToolTip = 'Specifies the position of the component on the bill of material.';
                }
                field("Position 2"; Rec."Position 2")
                {
                    ToolTip = 'Specifies the second reference number for the component position, such as the alternate position number of a component on a circuit board.';
                }
                field("Position 3"; Rec."Position 3")
                {
                    ToolTip = 'Specifies the third reference number for the component position on a bill of material, such as the alternate position number of a component on a print card.';
                }
                field("Lead-Time Offset"; Rec."Lead-Time Offset")
                {
                    ToolTip = 'Specifies the lead-time offset for the planning component.';
                }
                field("Routing Link Code"; Rec."Routing Link Code")
                {
                    ToolTip = 'Specifies a routing link code to link a planning component with a specific operation.';
                }
                field("Scrap %"; Rec."Scrap %")
                {
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the variant of the item on the line.';
                }
                field("Qty. Rounding Precision"; Rec."Qty. Rounding Precision")
                {
                    ToolTip = 'Specifies the value of the Qty. Rounding Precision field.';
                }
                field("Qty. Rounding Precision (Base)"; Rec."Qty. Rounding Precision (Base)")
                {
                    ToolTip = 'Specifies the value of the Qty. Rounding Precision (Base) field.';
                }
                field("Expected Quantity"; Rec."Expected Quantity")
                {
                    ToolTip = 'Specifies the expected quantity of this planning component line.';
                }
                field("Flushing Method"; Rec."Flushing Method")
                {
                    ToolTip = 'Specifies the value of the Flushing Method field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the code for the inventory location, where the item on the planning component line will be registered.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ToolTip = 'Specifies the value of the Bin Code field.';
                }
                field("Supplied-by Line No."; Rec."Supplied-by Line No.")
                {
                    ToolTip = 'Specifies the value of the Supplied-by Line No. field.';
                }
                field("Planning Level Code"; Rec."Planning Level Code")
                {
                    ToolTip = 'Specifies the value of the Planning Level Code field.';
                }
                field("Ref. Order Status"; Rec."Ref. Order Status")
                {
                    ToolTip = 'Specifies the value of the Ref. Order Status field.';
                }
                field("Ref. Order No."; Rec."Ref. Order No.")
                {
                    ToolTip = 'Specifies the value of the Ref. Order No. field.';
                }
                field("Ref. Order Line No."; Rec."Ref. Order Line No.")
                {
                    ToolTip = 'Specifies the value of the Ref. Order Line No. field.';
                }
                field(Length; Rec.Length)
                {
                    ToolTip = 'Specifies the length of one item unit when measured in the specified unit of measure.';
                }
                field(Width; Rec.Width)
                {
                    ToolTip = 'Specifies the width of one item unit when measured in the specified unit of measure.';
                }
                field(Weight; Rec.Weight)
                {
                    ToolTip = 'Specifies the weight of one item unit when measured in the specified unit of measure.';
                }
                field(Depth; Rec.Depth)
                {
                    ToolTip = 'Specifies the depth of one item unit when measured in the specified unit of measure.';
                }
                field("Calculation Formula"; Rec."Calculation Formula")
                {
                    ToolTip = 'Specifies how to calculate the Quantity field.';
                }
                field("Quantity per"; Rec."Quantity per")
                {
                    ToolTip = 'Specifies how many units of the component are required to produce the parent item.';
                }
                field("Ref. Order Type"; Rec."Ref. Order Type")
                {
                    ToolTip = 'Specifies the value of the Ref. Order Type field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ToolTip = 'Specifies the total cost for this planning component line.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the date when this planning component must be finished.';
                }
                field("Due Time"; Rec."Due Time")
                {
                    ToolTip = 'Specifies the value of the Due Time field.';
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Direct Unit Cost field.';
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    ToolTip = 'Specifies the value of the Indirect Cost % field.';
                }
                field("Overhead Rate"; Rec."Overhead Rate")
                {
                    ToolTip = 'Specifies the value of the Overhead Rate field.';
                }
                field("Direct Cost Amount"; Rec."Direct Cost Amount")
                {
                    ToolTip = 'Specifies the value of the Direct Cost Amount field.';
                }
                field("Overhead Amount"; Rec."Overhead Amount")
                {
                    ToolTip = 'Specifies the value of the Overhead Amount field.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Qty. per Unit of Measure field.';
                }
                field("Quantity (Base)"; Rec."Quantity (Base)")
                {
                    ToolTip = 'Specifies the value in the Quantity field on the line.';
                }
                field("Reserved Qty. (Base)"; Rec."Reserved Qty. (Base)")
                {
                    ToolTip = 'Specifies the reserved quantity of the item, in base units of measure.';
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ToolTip = 'Specifies the quantity of units that are reserved.';
                }
                field("Expected Quantity (Base)"; Rec."Expected Quantity (Base)")
                {
                    ToolTip = 'Specifies the contents of the Expected Quantity field on the line, in base units of measure.';
                }
                field("Original Expected Qty. (Base)"; Rec."Original Expected Qty. (Base)")
                {
                    ToolTip = 'Specifies the value of the Original Expected Qty. (Base) field.';
                }
                field("Net Quantity (Base)"; Rec."Net Quantity (Base)")
                {
                    ToolTip = 'Specifies the value of the Net Quantity (Base) field.';
                }
                field("Due Date-Time"; Rec."Due Date-Time")
                {
                    ToolTip = 'Specifies the due date and the due time, which are combined in a format called "due date-time".';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field(Critical; Rec.Critical)
                {
                    ToolTip = 'Specifies the value of the Critical field.';
                }
                field("Planning Line Origin"; Rec."Planning Line Origin")
                {
                    ToolTip = 'Specifies the value of the Planning Line Origin field.';
                }
            }
        }
    }
}
