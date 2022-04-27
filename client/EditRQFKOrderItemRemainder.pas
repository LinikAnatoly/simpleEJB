
unit EditRQFKOrderItemRemainder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItemRemainderController ;

type
  TfrmRQFKOrderItemRemainderEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMaterialNameTxt : TLabel;
    edtMaterialNameTxt: TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblPriceWithoutNds : TLabel;
    edtPriceWithoutNds: TEdit;
    lblSumWithoutNds : TLabel;
    edtSumWithoutNds: TEdit;

  lblENDepartmentBudgetName : TLabel;
  edtENDepartmentBudgetName : TEdit;
  spbENDepartmentBudget : TSpeedButton;
  

  HTTPRIORQFKOrderItemRemainder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentBudgetClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQFKOrderItemRemainderEdit: TfrmRQFKOrderItemRemainderEdit;
  RQFKOrderItemRemainderObj: RQFKOrderItemRemainder;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
, ENDepartmentTypeController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, RQFKOrderItemRemainderController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderItemRemainderEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtENDepartmentBudgetName, edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDepartmentBudgetName
      ,spbENDepartmentBudget
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      //,edtPriceWithoutNds
      //,edtSumWithoutNds
      ,edtENDepartmentBudgetName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQFKOrderItemRemainderObj.code);
    edtMaterialNameTxt.Text := RQFKOrderItemRemainderObj.materialNameTxt; 
    if ( RQFKOrderItemRemainderObj.countGen <> nil ) then
       edtCountGen.Text := RQFKOrderItemRemainderObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 
{
    if ( RQFKOrderItemRemainderObj.priceWithoutNds <> nil ) then
       edtPriceWithoutNds.Text := RQFKOrderItemRemainderObj.priceWithoutNds.decimalString
    else
       edtPriceWithoutNds.Text := '';
    if ( RQFKOrderItemRemainderObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQFKOrderItemRemainderObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := '';
}
    edtENDepartmentBudgetName.Text := RQFKOrderItemRemainderObj.budget.name;

  end;
end;



procedure TfrmRQFKOrderItemRemainderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      //,edtPriceWithoutNds
      //,edtSumWithoutNds
      , edtENDepartmentBudgetName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQFKOrderItemRemainder := HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;


     RQFKOrderItemRemainderObj.materialNameTxt := edtMaterialNameTxt.Text; 

     if (RQFKOrderItemRemainderObj.countGen = nil ) then
       RQFKOrderItemRemainderObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKOrderItemRemainderObj.countGen.decimalString := edtCountGen.Text 
     else
       RQFKOrderItemRemainderObj.countGen := nil;
{
     if (RQFKOrderItemRemainderObj.priceWithoutNds = nil ) then
       RQFKOrderItemRemainderObj.priceWithoutNds := TXSDecimal.Create;
     if edtPriceWithoutNds.Text <> '' then
       RQFKOrderItemRemainderObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text 
     else
       RQFKOrderItemRemainderObj.priceWithoutNds := nil;

     if (RQFKOrderItemRemainderObj.sumWithoutNds = nil ) then
       RQFKOrderItemRemainderObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQFKOrderItemRemainderObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text 
     else
       RQFKOrderItemRemainderObj.sumWithoutNds := nil;
}
    if DialogState = dsInsert then
    begin
      RQFKOrderItemRemainderObj.code:=low(Integer);
      TempRQFKOrderItemRemainder.add(RQFKOrderItemRemainderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKOrderItemRemainder.save(RQFKOrderItemRemainderObj);
    end;
  end;
end;


procedure TfrmRQFKOrderItemRemainderEdit.spbENDepartmentBudgetClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
   f: ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderItemRemainderObj.budget = nil then RQFKOrderItemRemainderObj.budget := ENDepartment.Create();
               //RQFKOrderItemRemainderObj.budget.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentBudgetName.Text:=GetReturnValue(sgENDepartment,1);
               RQFKOrderItemRemainderObj.budget.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentBudgetName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



end.