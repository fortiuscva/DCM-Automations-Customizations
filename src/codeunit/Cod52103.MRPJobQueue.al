codeunit 52103 "THK MRP Job Queue"
{
    TableNo = "Job Queue Entry";

    trigger OnRun()
    var
        DayofWeek: Record Date;
    begin
        RequisitionWkshName.Reset();
        RequisitionWkshName.SetRange("Worksheet Template Name", 'PLANNING');
        RequisitionWkshName.SetRange("THK Run From JobQueue", true);
        if RequisitionWkshName.FindSet()then repeat if DayofWeek.get(DayofWeek."Period Type"::Date, WorkDate()) and (((RequisitionWkshName."THK Monday") and (DayofWeek."Period No." = 1)) or ((RequisitionWkshName."THK Tuesday") and (DayofWeek."Period No." = 2)) or ((RequisitionWkshName."THK Wednesday") and (DayofWeek."Period No." = 3)) or ((RequisitionWkshName."THK Thursday") and (DayofWeek."Period No." = 4)) or ((RequisitionWkshName."THK Friday") and (DayofWeek."Period No." = 5)) or ((RequisitionWkshName."THK Saturday") and (DayofWeek."Period No." = 6)) or ((RequisitionWkshName."THK Sunday") and (DayofWeek."Period No." = 7)))then begin
                    ReqLine.SETRANGE("Worksheet Template Name", RequisitionWkshName."Worksheet Template Name");
                    ReqLine.SETRANGE("Journal Batch Name", RequisitionWkshName.Name);
                    ReqLine.DELETEALL(TRUE);
                    Item.SETCURRENTKEY("Low-Level Code");
                    Item.SETRANGE(Blocked, false);
                    //Item.SetRange("Vendor No.", RequisitionWkshName."THK Vendor No.");
                    Item.Setfilter("Vendor No.", RequisitionWkshName."THK Vendor No.");
                    // Run calculate Plan for both MPS & MRP
                    Clear(CalculatePlanPlanWksh);
                    CalculatePlanPlanWksh.USEREQUESTPAGE:=false;
                    CalculatePlanPlanWksh.SETTABLEVIEW(Item);
                    CalculatePlanPlanWksh.SetTemplAndWorksheet(RequisitionWkshName."Worksheet Template Name", RequisitionWkshName.Name, true);
                    CalculatePlanPlanWksh.InitializeRequest(TODAY + 1, CALCDATE('<6M>', TODAY + 1), true, true, true, '', 0D, false);
                    CalculatePlanPlanWksh.RUNMODAL;
                end;
            until RequisitionWkshName.Next() = 0;
    end;
    var ReqLine: Record "Requisition Line";
    Item: Record Item;
    RequisitionWkshName: Record "Requisition Wksh. Name";
    CalculatePlanPlanWksh: Report "Calculate Plan - Plan. Wksh.";
}
