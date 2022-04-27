
unit EditENBuilding2ENact;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENBuilding2ENactController ;

type
  TfrmENBuilding2ENactEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblSumGen : TLabel;
    edtSumGen: TEdit;
    lblSumNds : TLabel;
    edtSumNds: TEdit;
    lblIsCalculationDate : TLabel;
    edtIsCalculationDate: TEdit;
    lblFinContractNumber : TLabel;
    edtFinContractNumber: TEdit;
    lblFinContractDate : TLabel;
    edtFinContractDate: TDateTimePicker;
    lblPartnerName : TLabel;
    edtPartnerName: TEdit;
    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;
    lblActNumber : TLabel;
    edtActNumber: TEdit;
    lblActDate : TLabel;
    edtActDate: TDateTimePicker;


  HTTPRIOENBuilding2ENact: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    btnViewActEnergyNET: TButton;
    HTTPRIOENAct: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnViewActEnergyNETClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBuilding2ENactEdit: TfrmENBuilding2ENactEdit;
  ENBuilding2ENactObj: ENBuilding2ENact;

implementation

uses ENActController, EditENAct, ENConsts;



{$R *.dfm}



procedure TfrmENBuilding2ENactEdit.FormShow(Sender: TObject);

begin

if DialogState = dsInsert then
  begin
  HideControls([btnViewActEnergyNET]);
  end;

  DisableControls([edtCode]);
  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSumGen
      ,edtIsCalculationDate
      ,edtActDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBuilding2ENactObj.code);
    SetTXSDecimalForTEdit(edtSumGen, ENBuilding2ENactObj.sumGen);
    SetTXSDecimalForTEdit(edtSumNds, ENBuilding2ENactObj.sumNds);
    if ( ENBuilding2ENactObj.isCalculationDate <> Low(Integer) ) then
       edtIsCalculationDate.Text := IntToStr(ENBuilding2ENactObj.isCalculationDate)
    else
       edtIsCalculationDate.Text := '';
    edtFinContractNumber.Text := ENBuilding2ENactObj.finContractNumber; 
    SetDateFieldForDateTimePicker(edtFinContractDate, ENBuilding2ENactObj.finContractDate);
    edtPartnerName.Text := ENBuilding2ENactObj.partnerName; 
    edtPartnerCode.Text := ENBuilding2ENactObj.partnerCode; 
//    if ( ENBuilding2ENactObj.isActFromEnergyNET <> nil ) then
//       edtIsActFromEnergyNET.Checked := ENBuilding2ENactObj.isActFromEnergyNET.asBoolean
//    else
//       edtIsActFromEnergyNET.Checked := false;
    edtActNumber.Text := ENBuilding2ENactObj.actNumber;
    SetDateFieldForDateTimePicker(edtActDate, ENBuilding2ENactObj.actDate);

    if ENBuilding2ENactObj.actRef.code <> low_int then
     HideControls([btnViewActEnergyNET],false)
    else
     HideControls([btnViewActEnergyNET]);

  end;
end;



procedure TfrmENBuilding2ENactEdit.btnViewActEnergyNETClick(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit:=TfrmENActEdit.Create(Application, dsView);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(ENBuilding2ENactObj.actRef.code );
    except
      on EConvertError do Exit;
    end;

    if frmENActEdit.ShowModal in [mrOk ,mrYes ] then
      begin
      end;

  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;
end;

procedure TfrmENBuilding2ENactEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSumGen
      //,edtIsCalculationDate
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;

     ENBuilding2ENactObj.sumGen := GetTXSDecimalFromTEdit(edtSumGen);
     ENBuilding2ENactObj.sumNds := GetTXSDecimalFromTEdit(edtSumNds);
     if ( edtIsCalculationDate.Text <> '' ) then
       ENBuilding2ENactObj.isCalculationDate := StrToInt(edtIsCalculationDate.Text)
     else
       ENBuilding2ENactObj.isCalculationDate := Low(Integer) ;
     ENBuilding2ENactObj.finContractNumber := edtFinContractNumber.Text; 
     ENBuilding2ENactObj.finContractDate := GetTXSDateFromTDateTimePicker(edtFinContractDate);
     ENBuilding2ENactObj.partnerName := edtPartnerName.Text; 
     ENBuilding2ENactObj.partnerCode := edtPartnerCode.Text; 
//	if(ENBuilding2ENactObj.isActFromEnergyNET = nil) then ENBuilding2ENactObj.isActFromEnergyNET := TXSBoolean.Create;
//     ENBuilding2ENactObj.isActFromEnergyNET.asBoolean := edtIsActFromEnergyNET.Checked;
     ENBuilding2ENactObj.actNumber := edtActNumber.Text; 
     ENBuilding2ENactObj.actDate := GetTXSDateTimeFromTDateTimePicker(edtActDate);	   

    if DialogState = dsInsert then
    begin
      ENBuilding2ENactObj.code:=low(Integer);
      TempENBuilding2ENact.add(ENBuilding2ENactObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuilding2ENact.save(ENBuilding2ENactObj);
    end;
  end;
end;


end.