unit EditENBranch2Customer04;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBranch2Customer04Controller ;

type
  TfrmENBranch2Customer04Edit = class(TDialogForm)
    lblCode: TLabel;
	  edtCode: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    lblCurrentAutomat: TLabel;
    edtCurrentAutomat: TEdit;
    HTTPRIOENBranch2Customer04: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    spbENCustomer04: TSpeedButton;
    edtENCustomer04: TEdit;
    lblCustomer04: TLabel;
    memAddress: TMemo;
    lblAddress: TLabel;
    lblENLineBranch: TLabel;
    edtENLineBranch: TEdit;
    spbENLineBranch: TSpeedButton;
    HTTPRIOENCustomer04: THTTPRIO;
    HTTPRIOAddress: THTTPRIO;
    lblPhone: TLabel;
    edtPhone: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENCustomer04Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

end;

var frmENBranch2Customer04Edit: TfrmENBranch2Customer04Edit;
  ENBranch2Customer04Obj: ENBranch2Customer04;

implementation

uses ENCustomer04Controller, ShowENCustomer04,
  EditAddress, AddressController, ProvinceController, RegionController;

{$R *.dfm}

procedure TfrmENBranch2Customer04Edit.FormShow(Sender: TObject);
var TempENCustomer04: ENCustomer04ControllerSoapPort;
  ENCustomer04Obj: ENCustomer04;
  TempAddress: AddressControllerSoapPort;
  AddressObj: Address;
begin
  DisableControls([edtENLineBranch, spbENLineBranch, memAddress]);
  SetFloatStyle([edtCurrentAutomat]);
  if DialogState = dsView then
    DisableControls([spbENCustomer04, edtName, edtCurrentAutomat]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtENCustomer04{, edtName}]);

  if (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENBranch2Customer04Obj.code);
      edtName.Text := ENBranch2Customer04Obj.name;
      if ENBranch2Customer04Obj.currentAutomat <> nil then
         edtCurrentAutomat.Text :=
           ENBranch2Customer04Obj.currentAutomat.decimalString
      else
         edtCurrentAutomat.Text := '';
      if ENBranch2Customer04Obj.customer04Ref <> nil then
        if ENBranch2Customer04Obj.customer04Ref.code <> low(Integer) then
          begin
            TempENCustomer04 :=
              HTTPRIOENCustomer04 as ENCustomer04ControllerSoapPort;
            ENCustomer04Obj := TempENCustomer04.getObject(
              ENBranch2Customer04Obj.customer04Ref.code);
            try
              edtENCustomer04.Text := ENCustomer04Obj.name;
              edtPhone.Text := ENCustomer04Obj.phone;
              if ENCustomer04Obj.address <> '' then
                memAddress.Text := ENCustomer04Obj.address
              else if ENCustomer04Obj.addressRef <> nil then
                if ENCustomer04Obj.addressRef.code <> low(Integer) then
                  begin
                    TempAddress := HTTPRIOAddress as AddressControllerSoapPort;
                    AddressObj :=
                      TempAddress.getObject(ENCustomer04Obj.addressRef.code);
                    try
                      if AddressObj.street <> nil then
                        begin
                          if AddressObj.street.city <> nil then
                            begin
                              if AddressObj.street.city.region <> nil then
                                if (AddressObj.street.city.region.name <> '')
                                then
                                  begin
                                    if (AddressObj.street.city.region.code <> 0)
                                    and (AddressObj.street.city.region.code
                                      <> 1)
                                    then
                                      memAddress.Text :=
                                        AddressObj.street.city.region.name
                                          + 'р-н, '
                                    else if (AddressObj.street.city.region.code
                                      = 1)
                                    and (AddressObj.street.city.code = 1) then
                                      memAddress.Text :=
                                        AddressObj.street.city.region.name
                                          + ', ';
                                  end;
                              if AddressObj.street.city.cityType <> nil then
                                if (AddressObj.street.city.cityType.name <> '')
                                and (AddressObj.street.city.cityType.name
                                  <> '_невідомо_')
                                then
                                  memAddress.Text := memAddress.Text +
                                    AddressObj.street.city.cityType.name + ' ';
                              memAddress.Text := memAddress.Text
                                + AddressObj.street.city.name;
                            end;
                          if AddressObj.street.streetType <> nil then
                            if (AddressObj.street.streetType.name <> '')
                            and (AddressObj.street.streetType.name
                              <> '_невідомо_')
                            then
                              memAddress.Text := memAddress.Text +
                                AddressObj.street.streetType.name + ' ';
                          memAddress.Text := memAddress.Text
                            + AddressObj.street.name;
                        end;
                      if AddressObj.location.house <> '' then
                        memAddress.Text :=
                          memAddress.Text  + ', ' + AddressObj.location.house;
                      if AddressObj.location.App <> '' then
                        memAddress.Text :=
                          memAddress.Text  + ', кв.' + AddressObj.location.App;
                    finally
                      AddressObj.Free;
                      AddressObj := nil;
                    end;
                  end;
            finally
              ENCustomer04Obj.Free;
              ENCustomer04Obj := nil;
            end;
          end;
    end;
end;

procedure TfrmENBranch2Customer04Edit.FormClose(
  Sender: TObject;  var Action: TCloseAction);
var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtName]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы!'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENBranch2Customer04 :=
          HTTPRIOENBranch2Customer04 as ENBranch2Customer04ControllerSoapPort;
         ENBranch2Customer04Obj.name := edtName.Text;
         if ENBranch2Customer04Obj.currentAutomat = nil then
           ENBranch2Customer04Obj.currentAutomat := TXSDecimal.Create;
         if edtCurrentAutomat.Text <> '' then
           ENBranch2Customer04Obj.currentAutomat.decimalString :=
             edtCurrentAutomat.Text
         else
           ENBranch2Customer04Obj.currentAutomat := nil;

        if DialogState = dsInsert then
          begin
            ENBranch2Customer04Obj.code := low(Integer);
            TempENBranch2Customer04.add(ENBranch2Customer04Obj);
          end
        else if DialogState = dsEdit then
          TempENBranch2Customer04.save(ENBranch2Customer04Obj);
      end;
end;

procedure TfrmENBranch2Customer04Edit.spbENCustomer04Click(Sender: TObject);
var frmENCustomer04Show: TfrmENCustomer04Show;
begin
  frmENCustomer04Show := TfrmENCustomer04Show.Create(Application, fmNormal);
  try
    with frmENCustomer04Show do
      if ShowModal = mrOk then
        begin
          try
            if ENBranch2Customer04Obj.customer04Ref = nil then
              ENBranch2Customer04Obj.customer04Ref := ENCustomer04Ref.Create();
            ENBranch2Customer04Obj.customer04Ref.code :=
              ShowENCustomer04.customer04Code;
            edtENCustomer04.Text := GetReturnValue(sgENCustomer04, 1);
            memAddress.Text := GetReturnValue(sgENCustomer04, 2);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENCustomer04Show.Free;
  end;
end;

end.
