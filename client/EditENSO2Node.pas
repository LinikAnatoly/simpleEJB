
unit EditENSO2Node;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2NodeController ;

type
  TfrmENSO2NodeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCcNodeCode : TLabel;
    edtCcNodeCode: TEdit;
    lblPower : TLabel;
    edtPower: TEdit;
    lblDescription : TLabel;
    edtDescription: TEdit;


  HTTPRIOENSO2Node: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    chkIsCalc: TCheckBox;
    lblServicesName: TLabel;
    edtServicesName: TEdit;
    spbENServicesObject: TSpeedButton;
    lblSO2NodeType: TLabel;
    edtSO2NodeType: TEdit;
    spbSO2NodeType: TSpeedButton;
    HTTPRIOENSO2NodeType: THTTPRIO;
    HTTPRIOENServicesObject: THTTPRIO;
    lblCCTowerCode: TLabel;
    spbCCTower: TSpeedButton;
    edtCCTowerCode: TEdit;
    HTTPRIOCCTower: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENServicesObjectClick(Sender: TObject);
    procedure spbSO2NodeTypeClick(Sender: TObject);
    procedure spbCCTowerClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSO2NodeEdit: TfrmENSO2NodeEdit;
  ENSO2NodeObj: ENSO2Node;

implementation

uses ENConsts, ShowENServicesConnection, ENServicesObjectController,
  ENServicesContractKindController, ENServicesContractTypeController,
  ShowENSO2NodeType, ENSO2NodeTypeController, ShowCCTower, CCTowerController,
  CCNodeController, CCFeederController;


{uses  
    EnergyproController, EnergyproController2, ENSO2NodeController  ;
}
{$R *.dfm}



procedure TfrmENSO2NodeEdit.FormShow(Sender: TObject);
var   TempENServicesObject : ENServicesObjectControllerSoapPort;
      TempENSO2NodeType : ENSO2NodeTypeControllerSoapPort;
      TempCCTower : CCTowerControllerSoapPort;
      tower : CCTower;
      so : ENServicesObject;
      so2nodeType : ENSO2NodeType;
begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

    if (DialogState = dsInsert) then
    begin
      chkIsCalc.Checked := True;
    end;


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCcNodeCode
      ,edtDescription
      ,edtServicesName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSO2NodeObj.code);
    if ( ENSO2NodeObj.ccNodeCode <> Low(Integer) ) then
       edtCcNodeCode.Text := IntToStr(ENSO2NodeObj.ccNodeCode)
    else
       edtCcNodeCode.Text := '';
    if ( ENSO2NodeObj.power <> nil ) then
       edtPower.Text := ENSO2NodeObj.power.decimalString
    else
       edtPower.Text := '';
    edtDescription.Text := ENSO2NodeObj.description;

    if ( ENSO2NodeObj.isCalc <> Low(Integer) ) then
     begin
        if ENSO2NodeObj.isCalc = 1 then
           chkIsCalc.Checked := True
         else
           chkIsCalc.Checked := False;
     end;

   if ENSO2NodeObj.servicesobject <> nil then
     begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      so := TempENServicesObject.getObject(ENSO2NodeObj.servicesobject.code);
      edtServicesName.Text := so.contractNumberServices + ' | ' + so.contragentName;
     end;

      if ENSO2NodeObj.so2nodeType <> nil then
     begin
      TempENSO2NodeType := HTTPRIOENSO2NodeType as ENSO2NodeTypeControllerSoapPort;
      so2nodeType := TempENSO2NodeType.getObject(ENSO2NodeObj.so2nodeType.code);
      edtSO2NodeType.Text := so2nodeType.name;
     end;

     if ( ENSO2NodeObj.ccTowerCode <> Low(Integer) ) then
     begin
      TempCCTower := HTTPRIOCCTower as CCTowerControllerSoapPort;
      tower := TempCCTower.getObject(ENSO2NodeObj.ccTowerCode);
      edtCCTowerCode.Text := IntToStr(tower.code) + ' | ' + tower.name;
     end;

  end;
end;



procedure TfrmENSO2NodeEdit.spbENServicesObjectClick(Sender: TObject);
var
	frmShowENServicesConnection : TfrmENServicesConnectionShow;
	servicesFilter : ENServicesObjectFilter;
	servicesObjectCode : Integer;

begin

	servicesFilter := ENServicesObjectFilter.Create;
	SetNullXSProps(servicesFilter);
	SetNullIntProps(servicesFilter);
	servicesFilter.contractKindRef := ENServicesContractKindRef.Create;
	servicesFilter.contractKindRef.code := ENConsts.SERVICES_CONTRACT_KIND_SERVICES;
  servicesFilter.contractTypeRef := ENServicesContractTypeRef.Create;
  servicesFilter.contractTypeRef.code :=  ENConsts.ENSERVICESOBJECTTYPE_CONNECTION;
	frmShowENServicesConnection := TfrmENServicesConnectionShow.Create(Application,fmNormal, servicesFilter);

    DisableActions([frmShowENServicesConnection.actNoFilter]);
  try
		with frmShowENServicesConnection do
			if ShowModal = mrOk then begin

				try
					servicesObjectCode := StrToInt(GetReturnValue(sgENServicesObject,0));
        except on EConvertError do Exit;
				end;

        ENSO2NodeObj.servicesobject := ENServicesObjectRef.Create;
        ENSO2NodeObj.servicesobject.code := servicesObjectCode;

        edtServicesName.Text := GetReturnValue(sgENServicesObject,1) + ' | ' + GetReturnValue(sgENServicesObject,5);

			end;
	finally
        frmShowENServicesConnection.Free;
     end;
end;

procedure TfrmENSO2NodeEdit.spbSO2NodeTypeClick(Sender: TObject);
var
	frmShowENSO2NodeType: TfrmENSO2NodeTypeShow;
	servicesFilter : ENServicesObjectFilter;
	SO2NodeTypeCode : Integer;
begin

	frmShowENSO2NodeType := TfrmENSO2NodeTypeShow.Create(Application,fmNormal);

    DisableActions([frmShowENSO2NodeType.actNoFilter]);
  try
		with frmShowENSO2NodeType do
			if ShowModal = mrOk then begin

				try
					SO2NodeTypeCode := StrToInt(GetReturnValue(sgENSO2NodeType,0));
        except on EConvertError do Exit;
				end;

        ENSO2NodeObj.so2nodeType := ENSO2NodeTypeRef.Create;
        ENSO2NodeObj.so2nodeType.code := SO2NodeTypeCode;

        edtSO2NodeType.Text := GetReturnValue(sgENSO2NodeType,1);

			end;
	finally
        frmShowENSO2NodeType.Free;
     end;
end;

procedure TfrmENSO2NodeEdit.spbCCTowerClick(Sender: TObject);
var
  frmCCTowerShow: TfrmCCTowerShow;
  towerFilterObj: CCTowerFilter;
begin
  towerFilterObj:= CCTowerFilter.Create;
  SetNullIntProps(towerFilterObj);
  SetNullXSProps(towerFilterObj);
  towerFilterObj.feederref:=CCFeederRef.Create();
  towerFilterObj.feederref.code:=ENSO2NodeObj.ccNodeCode;

  frmCCTowerShow:= TfrmCCTowerShow.Create(Application,fmNormal, towerFilterObj);
  frmCCTowerShow.actInsert.Enabled:=False;
  frmCCTowerShow.actFilter.Enabled:=False;
  frmCCTowerShow.actNoFilter.Enabled:=False;
  try
    with frmCCTowerShow do
      if ShowModal = mrOk then
      begin
        edtCCTowerCode.Text:=GetReturnValue(sgCCTower,0) + ' | ' + GetReturnValue(sgCCTower,1);
        ENSO2NodeObj.ccTowerCode := StrToInt(GetReturnValue(sgCCTower,0));
      end;
  finally
    frmCCTowerShow.Free;
  end;
end;

procedure TfrmENSO2NodeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCcNodeCode
      ,edtDescription
      ,edtServicesName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;


     if ( edtCcNodeCode.Text <> '' ) then
       ENSO2NodeObj.ccNodeCode := StrToInt(edtCcNodeCode.Text)
     else
       ENSO2NodeObj.ccNodeCode := Low(Integer) ;

     if (ENSO2NodeObj.power = nil ) then
       ENSO2NodeObj.power := TXSDecimal.Create;
     if edtPower.Text <> '' then
       ENSO2NodeObj.power.decimalString := edtPower.Text 
     else
       ENSO2NodeObj.power := nil;

     ENSO2NodeObj.description := edtDescription.Text; 

     if chkIsCalc.Checked then
       ENSO2NodeObj.isCalc := 1
     else
       ENSO2NodeObj.isCalc := 0;

    if DialogState = dsInsert then
    begin
      ENSO2NodeObj.code:=low(Integer);
      TempENSO2Node.add(ENSO2NodeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSO2Node.save(ENSO2NodeObj);
    end;
  end;
end;


end.