
unit EditENCoefficientExecPlan;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCoefficientExecPlanController ;

type
  TfrmENCoefficientExecPlanEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCoefficient : TLabel;
    edtCoefficient: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;


  HTTPRIOENCoefficientExecPlan: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblFinCehName: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCoefficientExecPlanEdit: TfrmENCoefficientExecPlanEdit;
  ENCoefficientExecPlanObj: ENCoefficientExecPlan;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCoefficientExecPlanController  ;
}
{$R *.dfm}



procedure TfrmENCoefficientExecPlanEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;
  DisableControls([edtCode]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCoefficient
      ,edtDateGen

     ]);
   end;

   SetFloatStyle([edtCoefficient]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCoefficientExecPlanObj.code);
    if ( ENCoefficientExecPlanObj.coefficient <> nil ) then
       edtCoefficient.Text := ENCoefficientExecPlanObj.coefficient.decimalString
    else
       edtCoefficient.Text := ''; 
      if ENCoefficientExecPlanObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENCoefficientExecPlanObj.dateGen.Year,ENCoefficientExecPlanObj.dateGen.Month,ENCoefficientExecPlanObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

//    if ( ENCoefficientExecPlanObj.finPodrCode <> Low(Integer) ) then
//       edtFinPodrCode.Text := IntToStr(ENCoefficientExecPlanObj.finPodrCode)
//    else
//       edtFinPodrCode.Text := '';


  end;
end;



procedure TfrmENCoefficientExecPlanEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCoefficientExecPlan: ENCoefficientExecPlanControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCoefficient
      //,edtFinPodrCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCoefficientExecPlan := HTTPRIOENCoefficientExecPlan as ENCoefficientExecPlanControllerSoapPort;


     if (ENCoefficientExecPlanObj.coefficient = nil ) then
       ENCoefficientExecPlanObj.coefficient := TXSDecimal.Create;
     if edtCoefficient.Text <> '' then
       ENCoefficientExecPlanObj.coefficient.decimalString := edtCoefficient.Text 
     else
       ENCoefficientExecPlanObj.coefficient := nil;

     if edtdateGen.checked then
     begin 
       if ENCoefficientExecPlanObj.dateGen = nil then
          ENCoefficientExecPlanObj.dateGen := TXSDateTime.Create;
       ENCoefficientExecPlanObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENCoefficientExecPlanObj.dateGen := nil;	   

//     if ( edtFinPodrCode.Text <> '' ) then
//       ENCoefficientExecPlanObj.finPodrCode := StrToInt(edtFinPodrCode.Text)
//     else
//       ENCoefficientExecPlanObj.finPodrCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENCoefficientExecPlanObj.code:=low(Integer);
      TempENCoefficientExecPlan.add(ENCoefficientExecPlanObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCoefficientExecPlan.save(ENCoefficientExecPlanObj);
    end;
  end;
end;


end.