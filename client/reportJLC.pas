unit reportJLC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit, StdCtrls, ComCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient, ExtCtrls;

type
  TfrmReportJLC = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtJLCName: TEdit;
    lblJLCName: TLabel;
    HTTPRIOCCStreet: THTTPRIO;
    HTTPRIOCCRen: THTTPRIO;
    HTTPRIOCCCity: THTTPRIO;
    Label1: TLabel;
    lblCity: TLabel;
    lbl1Street: TLabel;
    cbStreetF: TComboBox;
    cbCityF: TComboBox;
    cbRenF: TComboBox;
    spbLinkedServicesObject: TSpeedButton;
    spbEraseLinkedServicesObject: TSpeedButton;
    HTTPRIOENServicesObject: THTTPRIO;
    HTTPRIOENGeneralContracts: THTTPRIO;
    rgIsRealized: TRadioGroup;
    lblNumberContract: TLabel;
    edtNumberContract: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure cbRenFKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure cbCityFEnter(Sender: TObject);
    procedure cbCityFExit(Sender: TObject);
    procedure cbCityFKeyPress(Sender: TObject; var Key: Char);
    procedure cbStreetFEnter(Sender: TObject);
    procedure cbStreetFKeyPress(Sender: TObject; var Key: Char);
    procedure spbLinkedServicesObjectClick(Sender: TObject);
    procedure spbEraseLinkedServicesObjectClick(Sender: TObject);
    procedure cbCityFChange(Sender: TObject);
    procedure cbStreetFChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbRenFChange(Sender: TObject);
  private
    { Private declarations }
    cityName, streetName : string;
    renCode : Integer;
  public
    { Public declarations }
  end;

var
  frmReportJLC: TfrmReportJLC;

  region: array [1..18] of String =
        ( 'Херсонський'
          ,'Білозерський'
          ,'Олешківський(Цюрупинский)'
          ,'Новокаховський'
          ,'Каховський'
          ,'Горностаївський'
          ,'Голопристанський'
          ,'Скадовський'
          ,'Чаплинський'
          ,'Каланчацький'
          ,'Новотроїцький'
          ,'Генічеський'
          ,'В.Лепетиський'
          ,'В.Рогачицький'
          ,'Олександрівський'
          ,'Високопільський'
          ,'Нововоронцовський'
          ,'Іванівський'

        );


implementation

uses EnergyproController, DMReportsUnit, CCRenController,
  CCAddressCityController, CCAddressStreetController,
  ENServicesObjectController, ShowENServicesObject, ENConsts, ChildFormUnit,
  ENGeneralContractsController;

{$R *.dfm}

procedure TfrmReportJLC.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName, strTabNumbers : String;
begin

    SetLength(argNames, 6);
    SetLength(args, 6);
    {
    argNames[0] := 'jlcName';
    if Length(edtJLCName.Text)>0 then
       args[0] :=  ' and upper(jlc.name) like upper(''%' + edtJLCName.Text +'%'')' else
    args[0] :=  '';

    argNames[1] := 'streetName';
    if Length(streetName)>0 then
       args[1] :=  ' and upper(s.name) like upper(''%' + streetName +'%'')' else
    args[1] :=  '';

    argNames[2] := 'cityName';
    if Length(cityName)>0 then
       args[2] :=  ' and upper(c.name) like upper(''%' + cityName +'%'')' else
    args[2] :=  '';

    argNames[3] := 'rencode';
    if renCode > Low(Integer) then
       args[3] :=  IntToStr(renCode) else
    args[3] :=  '0';
                             }

    argNames[0] := 'jlcName';
    if Length(edtJLCName.Text)>0 then
       args[0] :=  ' upper(''%' + edtJLCName.Text +'%'')' else
    args[0] :=  ' upper(''%%'')';

    argNames[1] := 'streetName';
    if Length(streetName)>0 then
       args[1] :=  ' upper(''%' + streetName +'%'')' else
    args[1] :=  ' upper(''%%'')';

    argNames[2] := 'cityName';
    if Length(cityName)>0 then
       args[2] :=  ' upper(''%' + cityName +'%'')' else
    args[2] :=  ' upper(''%%'')';

    argNames[3] := 'rencode';
    if renCode > Low(Integer) then
       args[3] :=  IntToStr(renCode) else
    args[3] :=  '0';

    argNames[4] := 'isRealized';
    if rgIsRealized.ItemIndex <> -1 then
       args[4] :=  IntToStr(rgIsRealized.ItemIndex) else
    args[4] :=  '-1';

    argNames[5] := 'contractNumberServices';
    if Length(edtNumberContract.Text)>0 then
       args[5] :=  edtNumberContract.Text else
    args[5] :=  '-1';

    reportName := 'Services/4Rent/post_report_from_billing/main';

    makeReport(reportName, argNames, args, 'xls');


end;

procedure TfrmReportJLC.cbCityFChange(Sender: TObject);
begin
  inherited;
  cityName := cbCityF.Text;
end;

procedure TfrmReportJLC.cbCityFEnter(Sender: TObject);
var
  TempCCCity: CCAddressCityControllerSoapPort;
  CCCityList: CCAddressCityShortList;
  CCCityFilterObj: CCAddressCityFilter;
  i: Integer;
  prevCityInList: string;
begin
  //cbRenF.ItemIndex:=cbRenF.Items.IndexOf(cbRenF.Text);
  if cbRenF.ItemIndex=-1 then Exit;
  //cbRenF.Text:=cbRenF.Items[cbRenF.ItemIndex];

  cbCityF.Items.Clear;
  cbStreetF.Items.Clear;

  //SUPP-89702
  {
  TempCCCity :=  HTTPRIOCCCity as CCAddressCityControllerSoapPort;
  CCCityFilterObj := CCAddressCityFilter.Create;
  SetNullIntProps(CCCityFilterObj);
  SetNullXSProps(CCCityFilterObj);
  CCCityFilterObj.conditionSQL := 'ccaddresscity.res=''' + CCRenshort(cbRenF.Items.Objects[cbRenF.ItemIndex]).res + '''';
  CCCityFilterObj.orderBySQL := 'ccaddresscity.name';
  CCCityList := TempCCCity.getScrollableFilteredList(CCCityFilterObj, 0, -1);

  prevCityInList:= '';
  for i:=0 to High(CCCityList.list) do
  begin
     if prevCityInList <> CCCityList.list[i].name then
     begin
       prevCityInList := CCCityList.list[i].name;
   //    cbCityF.Items.Add(CCCityList.list[i].name);
       cbCityF.Items.AddObject(CCCityList.list[i].name, CCCityList.list[i]);
     end;
  end;                }

  cbCityF.SetFocus;
end;

procedure TfrmReportJLC.cbCityFExit(Sender: TObject);
var
  TempCCStreet: CCAddressStreetControllerSoapPort;
  CCStreetList: CCAddressStreetShortList;
  CCStreetFilterObj: CCAddressStreetFilter;
  i: Integer;
  prevStreetInList: string;
begin
  if cbRenF.ItemIndex=-1 then Exit;
  if cbCityF.ItemIndex=-1 then Exit;

  cbStreetF.Items.Clear;
  //SUPP-89702
  {
  TempCCStreet :=  HTTPRIOCCStreet as CCAddressStreetControllerSoapPort;
  CCStreetFilterObj := CCAddressStreetFilter.Create;
  SetNullIntProps(CCStreetFilterObj);
  SetNullXSProps(CCStreetFilterObj);
  CCStreetFilterObj.conditionSQL := 'ccaddressstreet.res=' + '''' + CCRenshort(cbRenF.Items.Objects[cbRenF.ItemIndex]).res + ''''
    + ' and ccaddressstreet.esscitycode in ('
    + ' select c.esscode from ccaddresscity c where c.res='+ '''' + CCRenshort(cbRenF.Items.Objects[cbRenF.ItemIndex]).res + ''''
    + ' and c.name ilike '+''''+'%'+ StringReplace(cbCityF.Text, '''', '''''', [rfReplaceAll])+'%'+''''+')';
  CCStreetFilterObj.orderBySQL := 'ccaddressstreet.name';
  CCStreetList := TempCCStreet.getScrollableFilteredList(CCStreetFilterObj, 0, -1);

  prevStreetInList:= '';

  for i:=0 to High(CCStreetList.list) do
  begin
     if (prevStreetInList <> CCStreetList.list[i].name + CCStreetList.list[i].typetxt + CCStreetList.list[i].cityTxt)  then
     begin
       prevStreetInList := CCStreetList.list[i].name + CCStreetList.list[i].typetxt;
//       cbStreetF.Items.Add(CCStreetList.list[i].name);
       cbStreetF.Items.AddObject(CCStreetList.list[i].name + '(' + CCStreetList.list[i].typetxt + ')' + '(' + CCStreetList.list[i].cityTxt + ')', CCStreetList.list[i]);
     end;
  end;          }

  cbCityF.Text


end;

procedure TfrmReportJLC.cbCityFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    Key:=#9;
    cbStreetF.SetFocus;
  end;
end;

procedure TfrmReportJLC.cbRenFChange(Sender: TObject);
begin
  inherited;
  renCode := Integer(cbRenF.Items.Objects[cbRenF.ItemIndex]);
   //renCode :=  CCRenShort(cbRenF.Items.Objects[cbRenF.ItemIndex]).code;
end;

procedure TfrmReportJLC.cbRenFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    Key:=#9;
    cbCityF.SetFocus;
  end;
end;

procedure TfrmReportJLC.cbStreetFChange(Sender: TObject);
begin
  inherited;
  streetName := cbStreetF.Text;
  //streetName :=  CCAddressStreetShort(cbStreetF.Items.Objects[cbStreetF.ItemIndex]).name;
end;

procedure TfrmReportJLC.cbStreetFEnter(Sender: TObject);
begin
  inherited;
  if cbCityF.ItemIndex=-1 then Exit;
end;

procedure TfrmReportJLC.cbStreetFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key=#13 then
  begin
    Key:=#9;
  end;
end;

procedure TfrmReportJLC.FormCreate(Sender: TObject);
begin
  inherited;
  cityName :='';
  streetName:='';
end;

procedure TfrmReportJLC.FormShow(Sender: TObject);

var
TempCCRen  : CCRenControllerSoapPort;
i : Integer;
CCRenList : CCRenShortList;
CCRenFilterObj : CCRenFilter;
begin

  SetIntStyle(edtNumberContract);
 {
  TempCCRen :=  HTTPRIOCCRen as CCRenControllerSoapPort;
  CCRenFilterObj := CCRenFilter.Create;
  SetNullIntProps(CCRenFilterObj);
  SetNullXSProps(CCRenFilterObj);
  CCRenFilterObj.orderBySQL := 'ccren.name';
  CCRenList := TempCCRen.getScrollableFilteredList(CCRenFilterObj, 0, -1);

  for i:=0 to High(CCRenList.list) do
  begin
    cbRenF.Items.AddObject(CCRenList.list[i].name, CCRenList.list[i]);
  end;         }

  //SUPP-90189
  //Table region
  for I := 1 to High(region) do
    cbRenF.Items.AddObject(region[i], TObject(i));
end;

procedure TfrmReportJLC.spbEraseLinkedServicesObjectClick(Sender: TObject);
begin
  inherited;
   edtJLCName.Text := '';
end;

procedure TfrmReportJLC.spbLinkedServicesObjectClick(Sender: TObject);
var
	TempENServicesObject : ENServicesObjectControllerSoapPort;
	frmShowENServicesObject : TfrmENServicesObjectShow;
	linkedServicesFilter : ENServicesObjectFilter;
	servicesObjectCode : Integer;
	servicesObject : ENServicesObject;
  i : Integer;
begin

	TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

	linkedServicesFilter := ENServicesObjectFilter.Create;
	SetNullXSProps(linkedServicesFilter);
	SetNullIntProps(linkedServicesFilter);
	linkedServicesFilter.conditionSQL := ' code in (' +
                                       ' select max(so.code) ' +
                                       ' from enservicesobject so, engeneralcontracts g ' +
                                       ' where so.contracttyperefcode = ' + IntToStr(ENConsts.ENSERVICESOBJECTTYPE_OKSN) +
                                       ' and so.generalcontractrefcode = g.code ' +
                                       ' group by so.contragentname, g.axpartnername)';

	frmShowENServicesObject := TfrmENServicesObjectShow.Create(Application, fmNormal, linkedServicesFilter);
  DisableActions([frmShowENServicesObject.actNoFilter]);
      for i := 0 to 9 do
    frmShowENServicesObject.sgENServicesObject.ColWidths[i] := 1;

	try
		with frmShowENServicesObject do

			if ShowModal = mrOk then
      begin

				try
					servicesObjectCode := StrToInt(GetReturnValue(sgENServicesObject,0));
			   	except on EConvertError do Exit;
				end;

				servicesObject := TempENServicesObject.getObject(servicesObjectCode);

        edtJLCName.Text := servicesObject.name;

				end;

	finally
        frmShowENServicesObject.Free;
     end;
end;

end.
