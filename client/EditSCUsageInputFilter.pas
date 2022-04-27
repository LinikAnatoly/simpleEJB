
unit EditSCUsageInputFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputController, ExtCtrls ;

type
  TfrmSCUsageInputFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;

    lblNumberInt : TLabel;
    edtNumberInt: TEdit;

    lblDateGen : TLabel;
    edtDateGenStart: TDateTimePicker;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblMolCode : TLabel;
    edtMolCode: TEdit;

    lblMolName : TLabel;
    edtMolName: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  

  HTTPRIOSCUsageInput: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    Label1: TLabel;
    edtNumberOZ: TEdit;
    edtDateGenFinal: TDateTimePicker;
    Label2: TLabel;
    chbHasCountersIncome: TCheckBox;
    rgIsDocsReceived: TRadioGroup;
    spbStatus: TSpeedButton;
    lblStatus: TLabel;
    edtStatus: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure spbStatusClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmSCUsageInputFilterEdit: TfrmSCUsageInputFilterEdit;
  SCUsageInputFilterObj: SCUsageInputFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
, FINMolController, ShowFINMol, ENDepartment2EPRenController, ENConsts,
  ShowSCUsageInputStatus, SCUsageInputStatusController;


{$R *.dfm}


procedure TfrmSCUsageInputFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENDepartmentDepartmentName, edtStatus]);
end;



procedure TfrmSCUsageInputFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInput: SCUsageInputControllerSoapPort;
sql : String;
begin
  if (ModalResult = mrOk)  then
  begin

    sql := '';

    SCUsageInputFilterObj.numberDoc := edtNumberDoc.Text;



     if ( edtNumberInt.Text <> '' ) then
       SCUsageInputFilterObj.numberInt := StrToInt(edtNumberInt.Text)
     else
       SCUsageInputFilterObj.numberInt := Low(Integer) ;

     if (edtNumberOZ.Text <> '') then
     begin
      AddCondition(sql,
       'code in (select ui.usageinputrefcode from scusageinputitem ui, scusageinputitemoz oz where ui.code = oz.usageinputitemrefcode ' +
       ' and oz.numberdoc = ''' + edtNumberOZ.Text + ''')'
       );
     end;
     

     if edtdateGenStart.checked then
     begin

       AddCondition(sql, 'dategen >= to_date(''' + DateToStr(edtDateGenStart.Date) + ''', ''dd.MM.yyyy'')');

       {if SCUsageInputFilterObj.dateGen = nil then
          SCUsageInputFilterObj.dateGen := TXSDate.Create;
       SCUsageInputFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));}
     end;
     {
     else
       SCUsageInputFilterObj.dateGen := nil;
     }

     if edtdateGenFinal.checked then
     begin

       AddCondition(sql, 'dategen <= to_date(''' + DateToStr(edtDateGenFinal.Date) + ''', ''dd.MM.yyyy'')');

       {if SCUsageInputFilterObj.dateGen = nil then
          SCUsageInputFilterObj.dateGen := TXSDate.Create;
       SCUsageInputFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));}
     end;
     {
     else
       SCUsageInputFilterObj.dateGen := nil;
     }

     if edtdateStart.checked then
     begin
        AddCondition(sql, 'datestart >= to_date(''' + DateToStr(edtDateStart.Date) + ''', ''dd.MM.yyyy'')');
     {
       if SCUsageInputFilterObj.dateStart = nil then
          SCUsageInputFilterObj.dateStart := TXSDate.Create;
       SCUsageInputFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     }
     end;
     {
     else
       SCUsageInputFilterObj.dateStart := nil;
     }


     if edtdateFinal.checked then
     begin
         AddCondition(sql, 'datefinal <= to_date(''' + DateToStr(edtDateFinal.Date) + ''', ''dd.MM.yyyy'')');
     {
       if SCUsageInputFilterObj.dateFinal = nil then
          SCUsageInputFilterObj.dateFinal := TXSDate.Create;
       SCUsageInputFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     }
     end;
     {else
       SCUsageInputFilterObj.dateFinal := nil;
      }

     if chbHasCountersIncome.Checked then
       AddCondition(sql,
         'scusageinput.code in ' +
         '  (select ii.usageinputrefcode ' +
         '     from scusageinputitem ii ' +
         '    where ii.kindrefcode = ' + IntToStr(SC_USAGE_INPUT_ITEM_KIND_OUT_USING) + ')');

     SCUsageInputFilterObj.isDocsReceived := LOW_INT;
     case rgIsDocsReceived.ItemIndex of
       1: SCUsageInputFilterObj.isDocsReceived := YES;
       2: AddCondition(sql, 'coalesce(scusageinput.isdocsreceived, 0) <> 1');
     end;

     SCUsageInputFilterObj.molCode := edtMolCode.Text;
     SCUsageInputFilterObj.molName := edtMolName.Text;
     SCUsageInputFilterObj.commentGen := edtCommentGen.Text;

     SCUsageInputFilterObj.conditionSQL := sql;
  end;
end;

procedure TfrmSCUsageInputFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предпри€тие ’ќ≈ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if SCUsageInputFilterObj.department = nil then SCUsageInputFilterObj.department := ENDepartment.Create();
               SCUsageInputFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
{
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if SCUsageInputFilterObj.department = nil then SCUsageInputFilterObj.department := ENDepartment.Create();
               SCUsageInputFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;





procedure TfrmSCUsageInputFilterEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // –Ё—ы и ћќЋы
      //plan := DMReports.getPlanByCode(planCode);

   //if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
   if SCUsageInputFilterObj.department <> nil then
   if SCUsageInputFilterObj.department.code > LOW_INT then
   begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  SCUsageInputFilterObj.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;


   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtMolCode.Text := GetReturnValue(sgFINMol,0);
               edtMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmSCUsageInputFilterEdit.spbStatusClick(Sender: TObject);
var
  frmSCUsageInputStatusShow: TfrmSCUsageInputStatusShow;
  statusCode: Integer;
begin
   frmSCUsageInputStatusShow := TfrmSCUsageInputStatusShow.Create(Application, fmNormal);
   try
     with frmSCUsageInputStatusShow do
     begin
       DisableActions([actInsert, actEdit, actDelete]);
       if ShowModal = mrOk then
       begin
         try
           statusCode := StrToInt(GetReturnValue(sgSCUsageInputStatus, 0));
           SCUsageInputFilterObj.statusRef := SCUsageInputStatusRef.Create;
           SCUsageInputFilterObj.statusRef.code := statusCode;
           edtStatus.Text := GetReturnValue(sgSCUsageInputStatus, 1);
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmSCUsageInputStatusShow.Free;
   end;
end;

procedure TfrmSCUsageInputFilterEdit.spbPlanMOLClearClick(Sender: TObject);
begin
  inherited;
  edtMolCode.Text := '';
  edtMolName.Text := '';
end;

end.