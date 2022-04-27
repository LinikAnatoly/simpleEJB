unit EditENContragent;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContragentController  , ENTechConditionsObjectsController;

type
  TfrmENContragentEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblContragentName : TLabel;
    edtContragentName: TEdit;
    lblContragentAddress : TLabel;
    edtContragentAddress: TMemo;
    lblContragentAddressWork : TLabel;
    edtContragentAddressWork: TMemo;
    lblContragentPosition : TLabel;
    edtContragentPosition: TMemo;
    lblContragentOkpo : TLabel;
    edtContragentOkpo: TEdit;
    lblContragentBossName : TLabel;
    edtContragentBossName: TEdit;
    lblContragentPassport : TLabel;
    edtContragentPassport: TMemo;
  
  lblENBasisTypeBasisTypeName : TLabel;
  

  HTTPRIOENContragent: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    gbWarrantContrAgent: TGroupBox;
    lblWarrantFIO: TLabel;
    edtWarrantFIO: TEdit;
    lblWarrantNumber: TLabel;
    edtWarrantNumber: TEdit;
    lblWarrantDate: TLabel;
    edtWarrantDate: TDateTimePicker;
    lblWarrantPassport: TLabel;
    edtWarrantPassport: TMemo;
    lblWarrantAddress: TLabel;
    edtWarrantAddress: TMemo;
    gb2: TGroupBox;
    lblContragentBankAccount: TLabel;
    edtContragentBankAccount: TEdit;
    lblContragentBankName: TLabel;
    edtContragentBankName: TEdit;
    lblContragentBankMfo: TLabel;
    edtContragentBankMfo: TEdit;
    cbbBasisType: TComboBox;
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    lblTechConditionsItem: TLabel;
    edtTechConditionsItem: TEdit;
    btnCopyFromServicesObject: TBitBtn;
    HTTPRIOENTechConditionsServices: THTTPRIO;
    HTTPRIOENServicesObject: THTTPRIO;
    gb1: TGroupBox;
    lblNumberGen: TLabel;
    lblDateGen: TLabel;
    lblBuilding: TLabel;
    lblConnectionPowerPlaces: TLabel;
    lblConnectionPowerPoint: TLabel;
    Label8: TLabel;
    lblConnectionPowerPlacesNum: TLabel;
    lblConnectionPowerPointNum: TLabel;
    lblConnectionSource: TLabel;
    lblConnectionSourceNum: TLabel;
    lblCustomer: TLabel;
    lblAddress: TLabel;
    edtNumberGen: TEdit;
    edtDateGen: TDateTimePicker;
    edtBuilding: TEdit;
    mmoConnectionPowerPlaces: TMemo;
    mmoConnectionPowerPoint: TMemo;
    grpCurrentPower: TGroupBox;
    lblCat1CurrentPower: TLabel;
    lblCat2CurrentPower: TLabel;
    lblCat3CurrentPower: TLabel;
    edtCat1CurrentPower: TEdit;
    edtCat2CurrentPower: TEdit;
    edtCat3CurrentPower: TEdit;
    grpServicesPower: TGroupBox;
    lblCat1ServicesPower: TLabel;
    lblCat2ServicesPower: TLabel;
    lblCat3ServicesPower: TLabel;
    edtCat1ServicesPower: TEdit;
    edtCat2ServicesPower: TEdit;
    edtCat3ServicesPower: TEdit;
    grpOveral: TGroupBox;
    lblTyServicesPower: TLabel;
    lblTyCurrentPower: TLabel;
    lblPowerGeneration: TLabel;
    edtTyServicesPower: TEdit;
    edtTyCurrentPower: TEdit;
    edtPowerGeneration: TEdit;
    grpVoltage: TGroupBox;
    lblVoltageCurrent: TLabel;
    lblVoltageServices: TLabel;
    edtVoltageCurrent: TEdit;
    edtVoltageServices: TEdit;
    grpHeating: TGroupBox;
    lblTyServicesPowerCooker: TLabel;
    lblTyServicesPowerWater: TLabel;
    lblTyServicesPowerHeating: TLabel;
    edtTyServicesPowerCooker: TEdit;
    edtTyServicesPowerWater: TEdit;
    edtTyServicesPowerHeating: TEdit;
    mmoConnectionPowerPlacesNum: TMemo;
    mmoConnectionPowerPointNum: TMemo;
    mmoConnectionSource: TMemo;
    mmoConnectionSourceNum: TMemo;
    edtCustomer: TEdit;
    spbTechConditions: TSpeedButton;
    edtAddress: TMemo;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTechConditionsObjectsTechConObjectsClick(Sender : TObject);
    procedure cbbBasisTypeChange(Sender: TObject);
    procedure spbTechConditionsClick(Sender: TObject);
    procedure btnCopyFromServicesObjectClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
      ENTechCondObj : ENTechConditionsObjects;
      standartConnections : Boolean;

end;

var
  frmENContragentEdit: TfrmENContragentEdit;
  ENContragentObj: ENContragent;


implementation

uses
  ShowENTechConditionsObjects, ENBasisTypeController, ENConsts,
  EditENTechConditionsObjects, {ShowENBasisType,}
  ENTechConditionsServicesController, ENServicesObjectController;

{uses  
    EnergyproController, EnergyproController2, ENContragentController  ;
}
{$R *.dfm}



procedure TfrmENContragentEdit.FormShow(Sender: TObject);
 var
     TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtNumberGen
      ,spbTechConditions
      ,btnCopyFromServicesObject
       ]);
  end;

  DisableControls([edtCode, edtNumberGen, edtDateGen,
                   edtBuilding, edtTyServicesPower, edtTyCurrentPower,
                   mmoConnectionPowerPlaces, mmoConnectionPowerPoint]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtDateGen, edtContragentName, edtTechConditionsItem]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENContragentObj.code);
    edtContragentName.Text := ENContragentObj.contragentName;
    MakeMultiline(edtContragentAddress.Lines, ENContragentObj.contragentAddress);
    MakeMultiline(edtContragentAddressWork.Lines, ENContragentObj.contragentAddressWork);
    MakeMultiline(edtContragentPosition.Lines, ENContragentObj.contragentPosition);
    edtContragentOkpo.Text := ENContragentObj.contragentOkpo;
    edtContragentBankAccount.Text := ENContragentObj.contragentBankAccount; 
    edtContragentBankName.Text := ENContragentObj.contragentBankName; 
    edtContragentBankMfo.Text := ENContragentObj.contragentBankMfo; 
    edtContragentBossName.Text := ENContragentObj.contragentBossName; 
    MakeMultiline(edtContragentPassport.Lines, ENContragentObj.contragentPassport);
      if ENContragentObj.warrantDate <> nil then
      begin
        edtWarrantDate.DateTime:=EncodeDate(ENContragentObj.warrantDate.Year,ENContragentObj.warrantDate.Month,ENContragentObj.warrantDate.Day);
        edtWarrantDate.checked := true;
      end
      else
      begin
        edtWarrantDate.DateTime:=SysUtils.Date;
        edtWarrantDate.checked := false;
      end;
    edtWarrantNumber.Text := ENContragentObj.warrantNumber; 
    edtWarrantFIO.Text := ENContragentObj.warrantFIO; 
    MakeMultiline(edtWarrantPassport.Lines, ENContragentObj.warrantPassport);
    MakeMultiline(edtWarrantAddress.Lines, ENContragentObj.warrantAddress);

    cbbBasisType.ItemIndex := ENContragentObj.basisType.code;
    cbbBasisTypeChange(Sender);

    edtTechConditionsItem.Text := ENContragentObj.techConditionsItem;

    // объект Ту по контрагенту
    TempENTechConditionsObjects :=  HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
    ENTechCondObj:= TempENTechConditionsObjects.getObject(ENContragentObj.techConObjects.code);


    if ENTechCondObj <> nil then
    begin

     edtNumberGen.Text := ENTechCondObj.numberGen;

      if ENTechCondObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTechCondObj.dateGen.Year,ENTechCondObj.dateGen.Month,ENTechCondObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    edtCustomer.Text := ENTechCondObj.customer;

    edtBuilding.Text := ENTechCondObj.building;
    edtAddress.Text := ENTechCondObj.address;

    if ENTechCondObj.voltageCurrent <> Low(Integer) then
    edtVoltageCurrent.Text := IntToStr(ENTechCondObj.voltageCurrent);

    if ENTechCondObj.voltageServices <> Low(Integer) then
    edtVoltageServices.Text := IntToStr(ENTechCondObj.voltageServices);

    if ( ENTechCondObj.tyServicesPower <> nil ) then
       edtTyServicesPower.Text := ENTechCondObj.tyServicesPower.decimalString
    else
       edtTyServicesPower.Text := '';

    if ( ENTechCondObj.tyCurrentPower <> nil ) then
       edtTyCurrentPower.Text := ENTechCondObj.tyCurrentPower.decimalString
    else
       edtTyCurrentPower.Text := '';

    if ( ENTechCondObj.powerGeneration <> nil ) then
       edtPowerGeneration.Text := ENTechCondObj.powerGeneration.decimalString
    else
       edtPowerGeneration.Text := '';

    if ( ENTechCondObj.tyServicesPowerWaterHeating <> nil ) then
       edtTyServicesPowerWater.Text := ENTechCondObj.tyServicesPowerWaterHeating.decimalString
    else
       edtTyServicesPowerWater.Text := '';

    if ( ENTechCondObj.tyServicesPowerHeating <> nil ) then
       edtTyServicesPowerHeating.Text := ENTechCondObj.tyServicesPowerHeating.decimalString
    else
       edtTyServicesPowerHeating.Text := '';

    if ( ENTechCondObj.tyServicesPowerCooker <> nil ) then
       edtTyServicesPowerCooker.Text := ENTechCondObj.tyServicesPowerCooker.decimalString
    else
       edtTyServicesPowerCooker.Text := '';

    if ( ENTechCondObj.cat1CurrentPower <> nil ) then
       edtCat1CurrentPower.Text := ENTechCondObj.cat1CurrentPower.decimalString
    else
       edtCat1CurrentPower.Text := '';

    if ( ENTechCondObj.cat2CurrentPower <> nil ) then
       edtCat2CurrentPower.Text := ENTechCondObj.cat2CurrentPower.decimalString
    else
       edtCat2CurrentPower.Text := '';

    if ( ENTechCondObj.cat3CurrentPower <> nil ) then
       edtCat3CurrentPower.Text := ENTechCondObj.cat3CurrentPower.decimalString
    else
       edtCat3CurrentPower.Text := '';

    if ( ENTechCondObj.cat1ServicesPower <> nil ) then
       edtCat1ServicesPower.Text := ENTechCondObj.cat1ServicesPower.decimalString
    else
       edtCat1ServicesPower.Text := '';

    if ( ENTechCondObj.cat2ServicesPower <> nil ) then
       edtCat2ServicesPower.Text := ENTechCondObj.cat2ServicesPower.decimalString
    else
       edtCat2ServicesPower.Text := '';

    if ( ENTechCondObj.cat3ServicesPower <> nil ) then
       edtCat3ServicesPower.Text := ENTechCondObj.cat3ServicesPower.decimalString
    else
       edtCat3ServicesPower.Text := '';

    MakeMultiline(mmoConnectionPowerPlaces.Lines,ENTechCondObj.connectionPowerPlaces);
    MakeMultiline(mmoConnectionPowerPoint.Lines,ENTechCondObj.connectionPowerPoint);
    MakeMultiline(mmoConnectionPowerPlacesNum.Lines,ENTechCondObj.connectionPowerPlacesNum);
    MakeMultiline(mmoConnectionPowerPointNum.Lines,ENTechCondObj.connectionPowerPointNum);
    MakeMultiline(mmoConnectionSource.Lines,ENTechCondObj.connectionSource);
    MakeMultiline(mmoConnectionSourceNum.Lines,ENTechCondObj.connectionSourceNum);
    end;

  end;
end;



procedure TfrmENContragentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContragent: ENContragentControllerSoapPort;

begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtContragentName, edtNumberGen]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin

     // SUPP-1089...
     // 21.02.2013 +++ пункт ТУ обязателенен кроме стандартного присоединения
     if (not standartConnections) and (not NoBlankValues([edtTechConditionsItem])) then
     begin
       Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
       Action := caNone;
     end;


     TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;


     ENContragentObj.contragentName := edtContragentName.Text;

     ENContragentObj.contragentAddress := Trim(edtContragentAddress.Text);


     ENContragentObj.contragentAddressWork := Trim(edtContragentAddressWork.Text); 

     ENContragentObj.contragentPosition := edtContragentPosition.Text; 

     ENContragentObj.contragentOkpo := edtContragentOkpo.Text; 

     ENContragentObj.contragentBankAccount := edtContragentBankAccount.Text; 

     ENContragentObj.contragentBankName := edtContragentBankName.Text; 

     ENContragentObj.contragentBankMfo := edtContragentBankMfo.Text; 

     ENContragentObj.contragentBossName := edtContragentBossName.Text; 

     ENContragentObj.contragentPassport := edtContragentPassport.Text;
     if (cbbBasisType.ItemIndex <> -1) and (cbbBasisType.ItemIndex <> 0) then
     begin
       ENContragentObj.basisType := ENBasisType.Create;
       ENContragentObj.basisType.code := cbbBasisType.ItemIndex;
     end;

     if edtwarrantDate.checked then
     begin 
       if ENContragentObj.warrantDate = nil then
          ENContragentObj.warrantDate := TXSDate.Create;
       ENContragentObj.warrantDate.XSToNative(GetXSDate(edtwarrantDate.DateTime));
     end
     else
       ENContragentObj.warrantDate := nil;

     ENContragentObj.warrantNumber := edtWarrantNumber.Text; 

     ENContragentObj.warrantFIO := edtWarrantFIO.Text; 

     ENContragentObj.warrantPassport := edtWarrantPassport.Text; 

     ENContragentObj.warrantAddress := edtWarrantAddress.Text;

     ENContragentObj.techConditionsItem := edtTechConditionsItem.Text;


    if DialogState = dsInsert then
    begin
      ENContragentObj.code:=low(Integer);
      TempENContragent.add(ENContragentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENContragent.save(ENContragentObj);
    end;
  end;
end;


procedure TfrmENContragentEdit.spbENTechConditionsObjectsTechConObjectsClick(Sender : TObject);
var 
   frmENTechConditionsObjectsShow: TfrmENTechConditionsObjectsShow;
begin
   frmENTechConditionsObjectsShow:=TfrmENTechConditionsObjectsShow.Create(Application,fmNormal);
   try
      with frmENTechConditionsObjectsShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContragentObj.techConObjects = nil then ENContragentObj.techConObjects := ENTechConditionsObjects.Create();
               ENContragentObj.techConObjects.code := StrToInt(GetReturnValue(sgENTechConditionsObjects,0));
               edtNumberGen.Text:=GetReturnValue(sgENTechConditionsObjects,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTechConditionsObjectsShow.Free;
   end;
end;



procedure TfrmENContragentEdit.cbbBasisTypeChange(Sender: TObject);
begin
  inherited;
    HideControls([gbWarrantContrAgent], cbbBasisType.ItemIndex <> ENTECHCONDITIONSSERVICES_BASISTYPE_WARRANT);
  if cbbBasisType.ItemIndex <> ENTECHCONDITIONSSERVICES_BASISTYPE_WARRANT then
  begin
    ClearControlChildren(gbWarrantContrAgent);
    edtWarrantDate.Checked := false;
  end;
end;

procedure TfrmENContragentEdit.spbTechConditionsClick(Sender: TObject);
var
  frmENTechConditionsObjectsShow: TfrmENTechConditionsObjectsShow;
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;

  tcFilter : ENTechConditionsObjectsFilter;
  TUObject : ENTechConditionsObjects;
begin
  frmENTechConditionsObjectsShow := TfrmENTechConditionsObjectsShow.Create(Application, fmNormal);
  try
    with frmENTechConditionsObjectsShow do
    if ShowModal = mrOk then
    begin
      edtNumberGen.Text := GetReturnValue(sgENTechConditionsObjects, 1);
      edtDateGen.DateTime := StrToDateTime(GetReturnValue(sgENTechConditionsObjects, 2));
      edtCustomer.Text := GetReturnValue(sgENTechConditionsObjects, 3);

      ENContragentObj.techConObjects := ENTechConditionsObjects.Create;
      ENContragentObj.techConObjects.code := StrToInt(GetReturnValue(sgENTechConditionsObjects, 0));

      edtContragentName.Text := GetReturnValue(sgENTechConditionsObjects, 3);
      edtBuilding.Text := GetReturnValue( sgENTechConditionsObjects, 4);
      MakeMultiline(edtContragentAddressWork.Lines, GetReturnValue(sgENTechConditionsObjects, 5));
      MakeMultiline(edtAddress.Lines, GetReturnValue(sgENTechConditionsObjects, 5));
      edtTyServicesPower.Text := GetReturnValue(sgENTechConditionsObjects, 6);
      edtTyCurrentPower.Text := GetReturnValue(sgENTechConditionsObjects, 7);
    end;
  finally
    frmENTechConditionsObjectsShow.Free;
  end;
end;

procedure TfrmENContragentEdit.btnCopyFromServicesObjectClick(
  Sender: TObject);
var tcsTemp: ENTechConditionsServicesControllerSoapPort;
  tcsObj: ENTechConditionsServices;
  soTemp: ENServicesObjectControllerSoapPort;
  soFilter: ENServicesObjectFilter;
  soList: ENServicesObjectShortList;
begin
  if ENContragentObj.techCondServicesRef = nil then
    Exit;
  if ENContragentObj.techCondServicesRef.code = Low(Integer) then
    Exit;

  tcsTemp := HTTPRIOENTechConditionsServices
    as ENTechConditionsServicesControllerSoapPort;
  tcsObj := tcsTemp.getObject(ENContragentObj.techCondServicesRef.code);
  try
    if tcsObj.cnSubsystemTypeRef <> nil then
      if (tcsObj.cnSubsystemTypeRef.code <> Low(Integer))
      and (tcsObj.cnPackCode <> Low(Integer)) then
        begin
          soTemp :=
            HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
          soFilter := ENServicesObjectFilter.Create;
          try
            SetNullIntProps(soFilter);
            SetNullXSProps(soFilter);
            soFilter.cnPackCode := tcsObj.cnPackCode;

            soFilter.conditionSQL := ' enservicesobject.cnpackcode = ' +
              IntToStr(tcsObj.cnPackCode) +
              ' and enservicesobject.cnsubsystemtyperefcode = ' +
              IntToStr(tcsObj.cnSubsystemTypeRef.code) +
              ' and enservicesobject.contractstatusrefcode not in (' +
              IntToStr(ENSERVICESOBJECTSTATUS_CANCELED) + ', ' +
              IntToStr(ENSERVICESOBJECTSTATUS_TERMINATED) + ') ' +
              ' and enservicesobject.contracttyperefcode in (' +
              IntToStr(ENSERVICESOBJECTTYPE_TU) + ', ' +
              IntToStr(ENSERVICESOBJECTTYPE_CONNECTION) + ')';
            /// XXXXXXXX
            soList := soTemp.getScrollableFilteredList(soFilter, 0, -1);
            try
              if soList.totalCount > 0 then
                begin
                  if soList.list[0].contragentName <> '' then
                    edtContragentName.Text := soList.list[0].contragentName;
                  if soList.list[0].contragentAddress <> '' then
                    edtContragentAddress.Text :=
                      soList.list[0].contragentAddress;
                  if soList.list[0].contragentAddressWork <> '' then
                    edtContragentAddressWork.Text :=
                      soList.list[0].contragentAddressWork;
                  if soList.list[0].contragentPosition <> '' then
                    edtContragentPosition.Text :=
                      soList.list[0].contragentPosition;
                  if soList.list[0].contragentOkpo <> '' then
                    edtContragentOkpo.Text := soList.list[0].contragentOkpo;
                  if soList.list[0].contragentBossName <> '' then
                    edtContragentBossName.Text :=
                      soList.list[0].contragentBossName;
                  if soList.list[0].contragentPassport <> '' then
                    edtContragentPassport.Text :=
                      soList.list[0].contragentPassport;

                  if gbWarrantContrAgent.Visible then
                    begin
                      if soList.list[0].warrantFIO <> '' then
                        edtWarrantFIO.Text := soList.list[0].warrantFIO;
                      if soList.list[0].warrantNumber <> '' then
                        edtWarrantNumber.Text := soList.list[0].warrantNumber;

                      if soList.list[0].warrantDate <> nil then
                        edtWarrantDate.DateTime := EncodeDate(
                          soList.list[0].warrantDate.Year,
                          soList.list[0].warrantDate.Month,
                          soList.list[0].warrantDate.Day);
                      edtWarrantDate.Checked :=
                        (soList.list[0].warrantDate <> nil);

                      {edtWarrantPassport.Text := '';
                      edtWarrantAddress.Text := '';}
                    end;

                  if soList.list[0].contragentBankAccount <> '' then
                    edtContragentBankAccount.Text :=
                      soList.list[0].contragentBankAccount;
                  if soList.list[0].contragentBankName <> '' then
                    edtContragentBankName.Text :=
                      soList.list[0].contragentBankName;
                  if soList.list[0].contragentBankMfo <> '' then
                    edtContragentBankMfo.Text :=
                      soList.list[0].contragentBankMfo;
                end;
            finally
              soList.Free;
              soList := nil;
            end;
          finally
            soFilter.Free;
            soFilter := nil;
          end;
        end;
  finally
    tcsObj.Free;
    tcsObj := nil;
  end;
end;

end.
