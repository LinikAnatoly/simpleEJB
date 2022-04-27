
unit EditENCalcPowerReserveItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCalcPowerReserveItemController,
  ENCalcPowerReserveController, ENSO2NodeController, EditENServicesConnection,
  ShowENSO2NodeOthers ;

type
  TfrmENCalcPowerReserveItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblUserAdd : TLabel;


  HTTPRIOENCalcPowerReserveItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbENSO: TSpeedButton;
    spbSOClear: TSpeedButton;
    edtENSOContragentName: TEdit;
    HTTPRIOENSO2Node: THTTPRIO;
    lblCodeCalcPowerReserve: TLabel;
    edtCodeCalcPowerReserve: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENSOClick(Sender: TObject);
    procedure spbSOClearClick(Sender: TObject);


  
  private
    { Private declarations }
  public
    { Public declarations }
  powerReserveCode, codeSO: Integer;


end;

var
  frmENCalcPowerReserveItemEdit: TfrmENCalcPowerReserveItemEdit;
  ENCalcPowerReserveItemObj: ENCalcPowerReserveItem;
  codeENSO2Node, powerRCode: Integer;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCalcPowerReserveItemController  ;
}
{$R *.dfm}



procedure TfrmENCalcPowerReserveItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    //DenyBlankValues([   ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCalcPowerReserveItemObj.code);
  end;

  DisableControls([edtCodeCalcPowerReserve, edtENSOContragentName]);

  powerRCode := powerReserveCode;
  edtCodeCalcPowerReserve.Text := IntToStr(ENCalcPowerReserveItemObj.calcPowerReserveRef.code);

end;

procedure TfrmENCalcPowerReserveItemEdit.spbENSOClick(Sender: TObject);
var
    frmENSO2NodeOthersShow: TfrmENSO2NodeOthersShow;
    TempENSO2Node: ENSO2NodeControllerSoapPort;
    ENSO2NodeList: ENSO2NodeShortList;
    so2nodeFilter : ENSO2NodeFilter;
    codeENSO: Integer;
begin
    frmENSO2NodeOthersShow:= TfrmENSO2NodeOthersShow.Create(Application, fmNormal);
   try
      with frmENSO2NodeOthersShow do begin
        servicesobjectrefcode:= codeSO;
        if ShowModal = mrOk then
        begin
            try
               edtENSOContragentName.Text := GetReturnValue(sgENSO2NodeOthers,11);
               codeENSO2Node := StrToInt(GetReturnValue(sgENSO2NodeOthers,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENSO2NodeOthersShow.Free;
   end;

end;

procedure TfrmENCalcPowerReserveItemEdit.spbSOClearClick(Sender: TObject);
begin
      edtENSOContragentName.Text := '';
      codeENSO2Node := 0;
end;

procedure TfrmENCalcPowerReserveItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([ edtENSOContragentName, edtCodeCalcPowerReserve])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    //TempENCalcPowerReserveItem := HTTPRIOENCalcPowerReserveItem as ENCalcPowerReserveItemControllerSoapPort;

     if ENCalcPowerReserveItemObj.so2nodeRef = nil then
        ENCalcPowerReserveItemObj.so2nodeRef := ENSO2NodeRef.Create;
     ENCalcPowerReserveItemObj.so2nodeRef.code := codeENSO2Node;
   {
    if DialogState = dsInsert then
    begin
      ENCalcPowerReserveItemObj.code:=low(Integer);
      TempENCalcPowerReserveItem.add(ENCalcPowerReserveItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCalcPowerReserveItem.save(ENCalcPowerReserveItemObj);
    end;   }
  end;
end;


end.