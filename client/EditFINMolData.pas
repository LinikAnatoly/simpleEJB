
unit EditFINMolData;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMolDataController ;

type
  TfrmFINMolDataEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblFinMolCode : TLabel;
    edtFinMolCode: TEdit;
    lblFinMolName : TLabel;
    edtFinMolName: TEdit;


  HTTPRIOFINMolData: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    cbFINMOLType: TComboBox;
    lblMOLDATAType: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbPlanMOLClick(Sender: TObject);

  
  private
    { Private declarations }
  public
    { Public declarations }
    parentCode : Integer;
    parentTypeCode : Integer;
    departmentCode : Integer;
end;

var
  frmFINMolDataEdit: TfrmFINMolDataEdit;
  FINMolDataObj: FINMolData;

implementation

uses FINMolController, ShowFINMol, FINMolTypeController,
  ENDepartment2EPRenController, ENConsts, ENDepartmentController, DMReportsUnit;


{uses  
    EnergyproController, EnergyproController2, FINMolDataController  ;
}
{$R *.dfm}



procedure TfrmFINMolDataEdit.FormShow(Sender: TObject);

begin
  DisableControls([edtFinMolCode, edtFinMolName, edtCode]);

  if DialogState = dsView then
  begin
    DisableControls([spbPlanMOL, spbPlanMOLClear]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinMolCode
      ,edtFinMolName
     ]);
   end;

 if  (DialogState = dsEdit) then
 begin
   DisableControls([cbFINMOLType]);
 end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(FINMolDataObj.code);
    edtFinMolCode.Text := FINMolDataObj.finMolCode;
    edtFinMolName.Text := FINMolDataObj.finMolName; 

    cbFINMOLType.ItemIndex := FINMolDataObj.molTypeRef.code - 1;

  end;
end;



procedure TfrmFINMolDataEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMolData: FINMolDataControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtFinMolCode
      ,edtFinMolName
     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;


     FINMolDataObj.finMolCode := edtFinMolCode.Text; 

     FINMolDataObj.finMolName := edtFinMolName.Text; 

     if FINMolDataObj.molTypeRef = nil then FINMolDataObj.molTypeRef := FINMolTypeRef.Create;
     FINMolDataObj.molTypeRef.code := cbFINMOLType.ItemIndex + 1;


    if DialogState = dsInsert then
    begin
      FINMolDataObj.code:=low(Integer);
      TempFINMolData.add(FINMolDataObj, parentCode , parentTypeCode);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINMolData.save(FINMolDataObj, parentCode , parentTypeCode);
    end;
  end;
end;


procedure TfrmFINMolDataEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  //molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // –Ё—ы и ћќЋы
      //plan := DMReports.getPlanByCode(planCode);

   //if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
     if departmentCode <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  departmentCode;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
        // mdax выбор ћќЋов
        if (( DMReports.UsesMDAXData(CONFIG_USES_MDAX_INVENTLOCATION) )
           and
           ( HTTPRIOENDepartment2EPRen.HTTPWebNode.UserName = 'energynet'
           )
            ) then
        begin
          f.id := IntToStr(renList.list[0].finRenCode)+'*';
        end
         else
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if ((length(f.conditionSQL) > 0) or (f.id <> '' )) then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFinMolCode.Text := GetReturnValue(sgFINMol,0);
               edtFINMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := GetReturnValue(sgFINMol,0);
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := GetReturnValue(sgFINMol,1);
               FINMolDataObj.finMolCode :=  edtFinMolCode.Text;
               FINMolDataObj.finMolName := edtFINMolName.Text;
{
               if FINMolDataObj.molTypeRef = nil then FINMolDataObj.molTypeRef := FINMolTypeRef.Create;
               FINMolDataObj.molTypeRef.code := cbFINMOLType.ItemIndex + 1;
}
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

end.
