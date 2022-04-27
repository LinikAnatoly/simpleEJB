unit EditAgreePartnerLink;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, ExtCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmAgreePartnerLinkEdit = class(TDialogForm)
    lblPartnerName: TLabel;
    lblPartnerCode: TLabel;
    spbOrg: TSpeedButton;
    lblRschet: TLabel;
    spbRschet: TSpeedButton;
    edtPartnerName: TEdit;
    edtPartnerCode: TEdit;
    edtRschet: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    rgStatus: TRadioGroup;
    HTTPRIOENServicesObject: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure spbOrgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbRschetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    orgId: Integer;
    axOrgAccount: String;
    rschet_id: Integer;
  public
    { Public declarations }
    agree_id: Integer;
    partner_status: String;
  end;

var
  frmAgreePartnerLinkEdit: TfrmAgreePartnerLinkEdit;

implementation

uses ShowRQOrg, ChildFormUnit, RQOrgRschetController, ShowRQOrgRschet, ENConsts,
  ENServicesObjectController;

{$R *.dfm}

procedure TfrmAgreePartnerLinkEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  //partner_status: String;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtPartnerCode, edtPartnerName])  then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
    else begin
      if agree_id = LOW_INT then
      begin
        Application.MessageBox(PChar('Не задан код договора !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
        Exit;
      end;

      if (orgId = LOW_INT) and (axOrgAccount = '') then
      begin
        Application.MessageBox(PChar('Не выбрана организация!'), PChar('Внимание!'), MB_ICONWARNING);
        if edtPartnerCode.CanFocus then edtPartnerCode.SetFocus;
        Exit;
      end;

      //partner_status := 'U';

      { Будем передавать partner_status из вызывающей формы (формы редактирования договора)
      // Статус партнера ("S" - продавец (исполнитель), "C" - покупатель (заказчик), "P" - соисполнитель (подрядчик), "U" - не определен)
      case rgStatus.ItemIndex of
        0: // Покупатель
          partner_status := 'C';
        1: // Продавец
          partner_status := 'S';
        2: // Прочий
          partner_status := 'U'
        else
          partner_status := 'U';
      end;
      }

      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

      if DialogState = dsInsert then
      begin
        TempENServicesObject.addAgreePartnerLink(agree_id, orgId, partner_status, rschet_id);
      end
      else
      if DialogState = dsEdit then
      begin
      end;

    end;
end;

procedure TfrmAgreePartnerLinkEdit.FormCreate(Sender: TObject);
begin
  orgId := LOW_INT;
  axOrgAccount := '';
  partner_status := 'U';
  rschet_id := LOW_INT;
  agree_id := LOW_INT;
end;

procedure TfrmAgreePartnerLinkEdit.FormShow(Sender: TObject);
begin
  if partner_status = 'C' then
    rgStatus.ItemIndex := 0
  else if partner_status = 'S' then
    rgStatus.ItemIndex := 1
  else
    rgStatus.ItemIndex := 2;

  DisableControls([edtPartnerCode, edtPartnerName, edtRschet, rgStatus]);
  DenyBlankValues([edtPartnerCode, edtPartnerName]);
end;

procedure TfrmAgreePartnerLinkEdit.spbOrgClick(Sender: TObject);
var
  frmRQOrgShow: TfrmRQOrgShow;
begin
  frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
  try
    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
          orgId := StrToInt(GetReturnValue(sgRQOrg, 0));
          axOrgAccount := GetReturnValue(sgRQOrg, 25);

          edtPartnerCode.Text := GetReturnValue(sgRQOrg, 0);
          edtPartnerName.Text := GetReturnValue(sgRQOrg, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgShow.Free;
  end;
end;

procedure TfrmAgreePartnerLinkEdit.spbRschetClick(Sender: TObject);
var
  frmRQOrgRschetShow: TfrmRQOrgRschetShow;
  rschetFilter: RQOrgRschetFilter;
begin
  if (orgId = LOW_INT) and (axOrgAccount = '') then
  begin
    Application.MessageBox(PChar('Сначала выберите организацию!'), PChar('Внимание!'), MB_ICONWARNING);
    if edtPartnerName.CanFocus then edtPartnerName.SetFocus;
    Exit;
  end;

  rschetFilter := RQOrgRschetFilter.Create;
  SetNullIntProps(rschetFilter);
  SetNullXSProps(rschetFilter);

  rschetFilter.orgId := orgId;
  rschetFilter.axOrgAccount := axOrgAccount;

  frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application, fmNormal, rschetFilter);
  try
    frmRQOrgRschetShow.DisableActions([frmRQOrgRschetShow.actInsert,
                                       frmRQOrgRschetShow.actEdit,
                                       frmRQOrgRschetShow.actDelete,
                                       frmRQOrgRschetShow.actFilter,
                                       frmRQOrgRschetShow.actNoFilter]);
    with frmRQOrgRschetShow do
      if ShowModal = mrOk then
      begin
        try
          rschet_id := StrToInt(GetReturnValue(sgRQOrgRschet, 0));
          edtRschet.Text := GetReturnValue(sgRQOrgRschet, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgRschetShow.Free;
  end;
end;

end.
