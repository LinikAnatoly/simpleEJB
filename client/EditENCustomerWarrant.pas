
unit EditENCustomerWarrant;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENCustomerWarrantController;

type
    TfrmENCustomerWarrantEdit = class(TDialogForm)

    HTTPRIOENCustomerWarrant: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblWarrantNumber: TLabel;
    edtWarrantNumber: TEdit;
    spbWarrantNumber: TSpeedButton;
    lblWarrantFIO: TLabel;
    edtWarrantFIO: TEdit;
    cbTypeCode: TCheckBox;
    HTTPRIOENWarrant: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbWarrantNumberClick(Sender: TObject);

  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCustomerWarrantEdit: TfrmENCustomerWarrantEdit;
  ENCustomerWarrantObj: ENCustomerWarrant;

implementation


uses
  ShowENWarrant
  , ENWarrantController
  , ENWarrantTypeController
  , ENConsts
  , EditENWarrant
;


{$R *.dfm}



procedure TfrmENCustomerWarrantEdit.FormShow(Sender: TObject);
var
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
  customerWarrantShort: ENCustomerWarrantShort;
begin
  TempENCustomerWarrant := HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtWarrantFIO, edtWarrantNumber]);
    DenyBlankValues([edtWarrantFIO, edtWarrantNumber]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    try
      customerWarrantShort := TempENCustomerWarrant.getShortObject(ENCustomerWarrantObj.code);
    except
      on EConvertError do Exit;
    end;

    edtWarrantNumber.Text := customerWarrantShort.warrantRefNumbergen;
    edtWarrantFIO.Text := customerWarrantShort.warrantRefWarrantFIO;

    cbTypeCode.Checked := (ENCustomerWarrantObj.typeCode = YES);
  end;
end;


procedure TfrmENCustomerWarrantEdit.spbWarrantNumberClick(Sender: TObject);
var
  frmENWarrantShow: TfrmENWarrantShow;
  warrantFilter: ENWarrantFilter;
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
  customerWarrantShort: ENCustomerWarrantShort;
  TempENWarrant: ENWarrantControllerSoapPort;
begin
  inherited;

  if (DialogState = dsView) then
  begin
    TempENCustomerWarrant := HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;
    TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;

    try
      customerWarrantShort := TempENCustomerWarrant.getShortObject(ENCustomerWarrantObj.code);
      ENWarrantObj := TempENWarrant.getObject(customerWarrantShort.warrantRefCode);
    except
      on EConvertError do Exit;
    end;

    frmENWarrantEdit := TfrmENWarrantEdit.Create(Application, dsView);
    try
      frmENWarrantEdit.ShowModal;
    finally
      frmENWarrantEdit.Free;
      frmENWarrantEdit := nil;
    end;

  end else
  begin
    warrantFilter := ENWarrantFilter.Create();
    SetNullXSProps(warrantFilter);
    SetNullIntProps(warrantFilter);

    warrantFilter.warrantTypeRef := ENWarrantTypeRef.Create;
    warrantFilter.warrantTypeRef.code := ENWARRANT_TYPE_FROM_SIDE;

    frmENWarrantShow := TfrmENWarrantShow.Create(Application, fmNormal, warrantFilter);
    DisableActions([frmENWarrantShow.actNoFilter]);
    frmENWarrantShow.isForFromSideType := True;

    try
      with frmENWarrantShow do
        if ShowModal = mrOk then
        begin
          try
            ENCustomerWarrantObj.warrantRef := ENWarrantRef.Create;
            ENCustomerWarrantObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant, 0));
            edtWarrantNumber.Text := GetReturnValue(sgENWarrant, 1);
            edtWarrantFIO.Text := GetReturnValue(sgENWarrant, 2);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmENWarrantShow.Free;
    end;
  end;
end;


procedure TfrmENCustomerWarrantEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([])  then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENCustomerWarrant := HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;

    if cbTypeCode.Checked then
      ENCustomerWarrantObj.typeCode := YES
    else ENCustomerWarrantObj.typeCode := NO;


    if DialogState = dsInsert then
    begin
      ENCustomerWarrantObj.code := Low(Integer);
      ENCustomerWarrantObj.code := TempENCustomerWarrant.add(ENCustomerWarrantObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCustomerWarrant.save(ENCustomerWarrantObj);
    end;
  end;
end;


end.