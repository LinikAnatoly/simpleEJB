unit bindSOCalculationToSOConnection;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ExtCtrls, AdvObj, ENServicesObjectController,
     ENServicesContractKindController, ENConsts, ShowENServicesCalculation ;

type
  TfrmENSOCalculationToSOConnectionBind = class(TDialogForm)
    gpbLinkedServices: TGroupBox;
    lblLinkedServicesObject: TLabel;
    spbLinkedServicesObject: TSpeedButton;
    edtLinkedServicesObject: TEdit;
    btnCancel: TButton;
    btnOk: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    procedure spbLinkedServicesObjectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    soElementCalculationCode : Integer;
  public
    { Public declarations }
    soElementConnectionCode: Integer;
  end;

var
  frmENSOCalculationToSOConnectionBind: TfrmENSOCalculationToSOConnectionBind;

implementation

{$R *.dfm}

procedure TfrmENSOCalculationToSOConnectionBind.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and (DialogState = dsInsert) then
    if not NoBlankValues([edtLinkedServicesObject ])  then
    begin
        Application.MessageBox(PChar('Виберіть номер договору!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Exit;
    end
    else
    begin
        TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
        TempENServicesObject.addBindSOCalculationToSOConnection(soElementCalculationCode, soElementConnectionCode);
    end;
end;

procedure TfrmENSOCalculationToSOConnectionBind.spbLinkedServicesObjectClick(
  Sender: TObject);
var
	TempENServicesObject : ENServicesObjectControllerSoapPort;
	frmENServicesCalculationShow : TfrmENServicesCalculationShow;
	linkedServicesFilter : ENServicesObjectFilter;
  enSOCalculationObj : ENServicesObject;
begin

  DisableControls([edtLinkedServicesObject]);
	TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

	linkedServicesFilter := ENServicesObjectFilter.Create;
	SetNullXSProps(linkedServicesFilter);
	SetNullIntProps(linkedServicesFilter);
  linkedServicesFilter.conditionSQL := 'coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_CONNECTION);

  linkedServicesFilter.contractKindRef := ENServicesContractKindRef.Create;
  linkedServicesFilter.contractKindRef.code := SERVICES_CONTRACT_KIND_SERVICES;

  frmENServicesCalculationShow := TfrmENServicesCalculationShow.Create(Application,fmNormal, linkedServicesFilter);
    DisableActions([frmENServicesCalculationShow.actNoFilter]);
  try
    with frmENServicesCalculationShow do
      if ShowModal = mrOk then begin
        try
          enSOCalculationObj := TempENServicesObject.getObject(StrToInt(GetReturnValue(sgENServicesObject,0)));
          soElementCalculationCode  := enSOCalculationObj.element.code;
        except on EConvertError do Exit;
        end;
        edtLinkedServicesObject.Text := GetReturnValue(sgENServicesObject,1);
    end;
  finally
        frmENServicesCalculationShow.Free;
  end;

end;

end.
