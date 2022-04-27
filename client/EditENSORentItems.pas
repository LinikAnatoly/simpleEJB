
unit EditENSORentItems;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSORentItemsController, AddressController ;

type
  TfrmENSORentItemsEdit = class(TDialogForm)

    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENSORentItems: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    cbStreetF: TComboBox;
    cbCityF: TComboBox;
    cbRenF: TComboBox;
    Label1: TLabel;
    lblCity: TLabel;
    lbl1Street: TLabel;
    HTTPRIOStreet: THTTPRIO;
    HTTPRIOCity: THTTPRIO;
    HTTPRIORegion: THTTPRIO;
    HTTPRIOAddress: THTTPRIO;
    HTTPRIOCityType: THTTPRIO;
    HTTPRIOStreetType: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbRenFKeyPress(Sender: TObject; var Key: Char);
    procedure cbCityFEnter(Sender: TObject);
    procedure cbCityFExit(Sender: TObject);
    procedure cbCityFKeyPress(Sender: TObject; var Key: Char);
    procedure cbStreetFEnter(Sender: TObject);
    procedure cbStreetFKeyPress(Sender: TObject; var Key: Char);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSORentItemsEdit: TfrmENSORentItemsEdit;
  ENSORentItemsObj: ENSORentItems;

implementation

uses EditENSubstation04, ENSubstation04Controller, ShowENSubstation04,
  ENElementController, ENLine04Controller, ShowENElement, DMReportsUnit,
  TKMaterialsController, ShowTKMaterials, EditTKMaterials, ENConsts,
  ShowENDepartment, ENDepartmentController, CCRenController,
  CCAddressCityController, CCAddressStreetController, ShowCCAddressStreet,
  EditCCAddressStreetFilter;


{uses
    EnergyproController, EnergyproController2, ENSORentItemsController  ;
}
{$R *.dfm}



procedure TfrmENSORentItemsEdit.FormShow(Sender: TObject);
var
i : Integer;
TempRegion : AddressController.RegionControllerSoapPort;
regList : RegionShortList;
regFilter : RegionFilter;

begin

  if (DialogState = dsInsert)  then
  begin
        DenyBlankValues([
          cbCityF , cbStreetF  , cbRenF
         ]);

       TempRegion :=  HTTPRIORegion as AddressController.RegionControllerSoapPort;
       regFilter := RegionFilter.Create;
       SetNullIntProps(regFilter);
       SetNullXSProps(regFilter);
       regFilter.orderBySQL := 'region.name';
       regList := TempRegion.getScrollableFilteredList(regFilter, 0, -1);

      for i:=0 to High(regList.list) do
      begin
        cbRenF.Items.AddObject(regList.list[i].name, regList.list[i]);
      end;

   end;

  if  (DialogState = dsView) then
  begin
     DisableControls([cbStreetF, cbCityF, cbRenF]);
     edtCode.Text := IntToStr(ENSORentItemsObj.code);
     cbStreetF.Text :=  ENSORentItemsObj.address;
     cbCityF.Text :=  ENSORentItemsObj.localityName;
     cbRenF.Text := IntToStr(ENSORentItemsObj.renCode);
  end;
end;



procedure TfrmENSORentItemsEdit.cbCityFEnter(Sender: TObject);
var
  i: Integer;

  TempCity : CityControllerSoapPort;
  cList : CityShortList;
  cFilter : CityFilter;
begin
  if cbRenF.ItemIndex=-1 then Exit;

  cbCityF.Items.Clear;
  cbStreetF.Items.Clear;

  TempCity :=  HTTPRIOCity as CityControllerSoapPort;
  cFilter := CityFilter.Create;
  SetNullIntProps(cFilter);
  SetNullXSProps(cFilter);
  cFilter.region := Region.Create;
  cFilter.region.code :=  RegionShort(cbRenF.Items.Objects[cbRenF.ItemIndex]).code;
  cFilter.orderBySQL := 'city.name';
  cList := TempCity.getScrollableFilteredList(cFilter, 0, -1);

  for i:=0 to High(cList.list) do
    begin
      cbCityF.Items.AddObject(cList.list[i].name, cList.list[i]);
    end;
  cbCityF.SetFocus;
end;

procedure TfrmENSORentItemsEdit.cbCityFExit(Sender: TObject);
var
  i: Integer;
  TempStreet : StreetControllerSoapPort;
  sList : StreetShortList;
  sFilter : StreetFilter;

begin
  if cbRenF.ItemIndex=-1 then Exit;
  if cbCityF.ItemIndex=-1 then Exit;

  cbStreetF.Items.Clear;

  TempStreet :=  HTTPRIOStreet as StreetControllerSoapPort;
  sFilter := StreetFilter.Create;
  SetNullIntProps(sFilter);
  SetNullXSProps(sFilter);
  sFilter.city := City.Create;
  sFilter.city.code := CityShort(cbCityF.Items.Objects[cbCityF.ItemIndex]).code;
  sFilter.orderBySQL := 'street.name';
  sList := TempStreet.getScrollableFilteredList(sFilter, 0, -1);

  for i:=0 to High(sList.list) do
   begin
    cbStreetF.Items.AddObject(sList.list[i].name + '(' + sList.list[i].streetTypeName + ')' + '(' + sList.list[i].cityName + ')', sList.list[i]);
   end;

end;

procedure TfrmENSORentItemsEdit.cbCityFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    Key:=#9;
    cbStreetF.SetFocus;
  end;
end;

procedure TfrmENSORentItemsEdit.cbRenFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    Key:=#9;
    cbCityF.SetFocus;
  end;
end;

procedure TfrmENSORentItemsEdit.cbStreetFEnter(Sender: TObject);
begin
  if cbCityF.ItemIndex=-1 then Exit;
end;

procedure TfrmENSORentItemsEdit.cbStreetFKeyPress(Sender: TObject;
  var Key: Char);
begin
If Key=#13 then
  begin
    Key:=#9;
  end;
end;

procedure TfrmENSORentItemsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSORentItems: ENSORentItemsControllerSoapPort;
var  TempStreet: StreetControllerSoapPort;
     TempCity: CityControllerSoapPort;
     TempStreetType: StreetTypeControllerSoapPort;
     TempCityType: CityTypeControllerSoapPort;
     StreetObj : Street;
     CityObj : City;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      cbStreetF, cbCityF, cbRenF

     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
    TempStreet :=   HTTPRIOStreet as StreetControllerSoapPort;
    TempCity :=   HTTPRIOCity as CityControllerSoapPort;
    TempStreetType :=   HTTPRIOStreetType as StreetTypeControllerSoapPort;
    TempCityType :=   HTTPRIOCityType as CityTypeControllerSoapPort;
    StreetObj:= TempStreet.getObject(StreetShort(cbStreetF.Items.Objects[cbStreetF.ItemIndex]).code);
    CityObj :=  TempCity.getObject(CityShort(cbCityF.Items.Objects[cbCityF.ItemIndex]).code);


    ENSORentItemsObj.localityName := TempCityType.getObject(CityObj.cityType.code).name + ' ' + CityObj.name;
    ENSORentItemsObj.address := TempStreetType.getObject(StreetObj.streetType.code).name + ' ' + StreetObj.name;

    ENSORentItemsObj.renCode :=  RegionShort(cbRenF.Items.Objects[cbRenF.ItemIndex]).rencode;
    ENSORentItemsObj.streetCode :=  StreetObj.code;

    if DialogState = dsInsert then
    begin
      ENSORentItemsObj.code:=low(Integer);
      TempENSORentItems.add(ENSORentItemsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSORentItems.save(ENSORentItemsObj);
    end;
  end;
end;


end.
