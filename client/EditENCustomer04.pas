unit EditENCustomer04;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCustomer04Controller;

type
  TfrmENCustomer04Edit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    HTTPRIOENCustomer04: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblAddress: TLabel;
    memAddress: TMemo;
    spbAddress: TSpeedButton;
    HTTPRIOAddress: THTTPRIO;
    spbAddressClear: TSpeedButton;
    lblPhone: TLabel;
    edtPhone: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbAddressClick(Sender: TObject);
    procedure spbAddressClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

end;

var frmENCustomer04Edit: TfrmENCustomer04Edit;
  ENCustomer04Obj: ENCustomer04;

implementation

uses EditAddress, AddressController, ProvinceController, RegionController;

{$R *.dfm}

procedure TfrmENCustomer04Edit.FormShow(Sender: TObject);
begin
  //DisableControls([memAddress]);
  if DialogState = dsView then
    DisableControls([edtName, spbAddress, memAddress]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENCustomer04Obj.code);
      edtName.Text := ENCustomer04Obj.name;
      if ENCustomer04Obj.address <> '' then
        memAddress.Text := ENCustomer04Obj.address;
      edtPhone.Text := ENCustomer04Obj.phone;
  end;
end;

procedure TfrmENCustomer04Edit.FormClose(
  Sender: TObject; var Action: TCloseAction);
var TempENCustomer04: ENCustomer04ControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtName, memAddress]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENCustomer04 :=
          HTTPRIOENCustomer04 as ENCustomer04ControllerSoapPort;
        ENCustomer04Obj.name := edtName.Text;
        ENCustomer04Obj.address := memAddress.Text;
        ENCustomer04Obj.phone := edtPhone.Text;
        if DialogState = dsInsert then
          begin
            ENCustomer04Obj.code:=low(Integer);
            TempENCustomer04.add(ENCustomer04Obj);
          end
        else if DialogState = dsEdit then
          TempENCustomer04.save(ENCustomer04Obj);
      end;
end;

procedure TfrmENCustomer04Edit.spbAddressClick(Sender: TObject);
var TempAddress: AddressControllerSoapPort;
begin
  if ENCustomer04Obj.addressRef <> nil then
    if ENCustomer04Obj.addressRef.code <> Low(Integer) then
      begin
        TempAddress := HTTPRIOAddress as AddressControllerSoapPort;
        try
          EditAddress.AddressObj :=
            TempAddress.getObject(ENCustomer04Obj.addressRef.code);
        except
          on EConvertError do Exit;
        end;
      end; //if ENCustomer04Obj.addressRef.code <> Low(Integer) then

  frmAddressEdit := TfrmAddressEdit.Create(Application, dsEdit);
  with frmAddressEdit do
    begin
      Label2.Caption := 'Район области';
      //Label6.Caption := '№ строения';
      //Label4.Visible := False;
      //edtApp.Visible := False;
      //spbApp.Visible := False;
      GroupBox1.Visible := False;
      btnOk.Top := edtApp.Top + edtApp.Height + 10;
      btnCancel.Top := btnOk.Top;
      Height := btnOk.Top + btnOk.Height + 40;
      edtProvince.Text := 'Херсонская';
      spbProvince.Enabled := False;
      ProvinceCode := 1;
    end; //with frmAddressEdit do

    if frmAddressEdit.ShowModal = mrOk then
      try
        if ENCustomer04Obj.addressRef = nil then
          ENCustomer04Obj.addressRef := AddressRef.Create;
        ENCustomer04Obj.addressRef.code := AddressCode;
        if (RegionCode <> 0) and (RegionCode <> 1) then
          memAddress.Text := RegionName + ' р-н, '
        else if (RegionCode = 1) and (CityCode <> 1) then
          memAddress.Text := RegionName + ', '
        else
          memAddress.Text := '';
        if CityTypeName = '_невідомо_' then
          CityTypeName := '';
        if StreetTypeName = '_невідомо_' then
          StreetTypeName := '';
        memAddress.Text := memAddress.Text + CityTypeName + ' ' + CityName
          + ', ' + StreetTypeName + ' ' + StreetName + ', ' + House;
        if App <> '' then
          memAddress.Text := memAddress.Text + ', кв. ' + App;
      finally
        frmAddressEdit.Free;
        frmAddressEdit := nil;
      end;
end;

procedure TfrmENCustomer04Edit.spbAddressClearClick(Sender: TObject);
begin
  ENCustomer04Obj.addressRef := nil;
  memAddress.Text := '';
end;

end.
