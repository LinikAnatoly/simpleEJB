
unit EditENDistributionAgree;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDistributionAgreeController,
  ENSO2DistrAgreeController, ExtCtrls ;

type
  TfrmENDistributionAgreeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENDistributionAgree: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    grpD3: TGroupBox;
    lblD3countername: TLabel;
    edtD3countername: TMemo;
    edtD3countertype: TMemo;
    lblD3countertype: TLabel;
    lblD3amperageratio: TLabel;
    edtD3amperageratio: TEdit;
    edtD3voltageratio: TEdit;
    lblD3voltageratio: TLabel;
    edtD3totalratio: TEdit;
    lblD3totalratio: TLabel;
    lblD3place: TLabel;
    edtD3place: TMemo;
    lblD3voltageclass: TLabel;
    lblD3workmode: TLabel;
    edtD3workmode: TEdit;
    lblD3tarifftype: TLabel;
    edtD3tarifftype: TEdit;
    edtD3accountingtype: TEdit;
    lblD3accountingtype: TLabel;
    grpD5: TGroupBox;
    grpOveral: TGroupBox;
    lblEic: TLabel;
    edtEic: TEdit;
    lblObjectname: TLabel;
    edtObjectname: TMemo;
    lblObjectaddress: TLabel;
    edtObjectaddress: TMemo;
    lblPower: TLabel;
    edtPower: TEdit;
    edtD5feederlist: TEdit;
    lblD5feederlist: TLabel;
    grpD6: TGroupBox;
    lblD6reliabilitypue: TLabel;
    lblD6reliabilityguaranteed: TLabel;
    lblD6balancesupplier: TLabel;
    lblD6balanceclient: TLabel;
    lblD6responsibilitysupplier: TLabel;
    edtD6responsibilitysupplier: TMemo;
    lblD6responsibilityclient: TLabel;
    edtD6responsibilityclient: TMemo;
    grpD7: TGroupBox;
    lblD7linesource: TLabel;
    edtD7linesource: TMemo;
    lblD7attachment: TLabel;
    edtD7attachment: TMemo;
    grpD8: TGroupBox;
    lblD8conditions: TLabel;
    edtD8conditions: TMemo;
    lblD8transformertype: TLabel;
    edtD8transformertype: TMemo;
    lblD8voltagebh: TLabel;
    edtD8voltagebh: TEdit;
    lblD8voltagehh: TLabel;
    edtD8voltagehh: TEdit;
    lblD8lossesxx: TLabel;
    edtD8lossesxx: TEdit;
    lblD8losseskz: TLabel;
    edtD8losseskz: TEdit;
    lblD8amperage: TLabel;
    edtD8amperage: TEdit;
    lblD8voltagekz: TLabel;
    edtD8voltagekz: TEdit;
    lblD8linelength: TLabel;
    edtD8linelength: TEdit;
    lblD8liner: TLabel;
    edtD8liner: TEdit;
    lblD8linex: TLabel;
    edtD8linex: TEdit;
    edtD8hours: TEdit;
    lblD8hours: TLabel;
    HTTPRIOENSO2DistrAgree: THTTPRIO;
    btnPrint: TBitBtn;
    btnPrintAgree: TBitBtn;
    btnPrintD2: TBitBtn;
    btnPrintD1: TBitBtn;
    btnPrintD3: TBitBtn;
    btnPrintD4: TBitBtn;
    btnPrintD5: TBitBtn;
    btnPrintD6: TBitBtn;
    btnPrintD7: TBitBtn;
    btnPrintD8: TBitBtn;
    grpWarrant: TGroupBox;
    lblWarrantFIO: TLabel;
    lblWarrantNumber: TLabel;
    btnWarrantNumber: TSpeedButton;
    edtWarrantFIO: TEdit;
    edtWarrantNumber: TEdit;
    btnspbeic: TSpeedButton;
    HTTPRIOCCRecordPoint: THTTPRIO;
    edtD6reliabilitypue: TComboBox;
    edtD6reliabilityguaranteed: TComboBox;
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    HTTPRIOENWarrant: THTTPRIO;
    lblD6BalanceLimit: TLabel;
    grpD2: TGroupBox;
    Label1: TLabel;
    edtD2fuse: TEdit;
    edtD6BalanceLimit: TComboBox;
    edtD6balancesupplier: TEdit;
    edtD6balanceclient: TEdit;
    edtD3voltageclass: TComboBox;
    chkPrintDop: TCheckBox;
    rgDopType: TRadioGroup;
    btnPrintDop: TBitBtn;
    lblContractName: TLabel;
    edtContractDate: TDateTimePicker;
    edtContractNumber: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnWarrantNumberClick(Sender: TObject);
    procedure btnspbeicClick(Sender: TObject);
    procedure btnPrintAgreeClick(Sender: TObject);
    procedure btnPrintD1Click(Sender: TObject);
    procedure btnPrintD2Click(Sender: TObject);
    procedure btnPrintD3Click(Sender: TObject);
    procedure btnPrintD4Click(Sender: TObject);
    procedure btnPrintD5Click(Sender: TObject);
    procedure btnPrintD6Click(Sender: TObject);
    procedure btnPrintD7Click(Sender: TObject);
    procedure btnPrintD8Click(Sender: TObject);
    procedure chkPrintDopClick(Sender: TObject);
    procedure btnPrintDopClick(Sender: TObject);
    procedure rgDopTypeClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    soCode, tcsCode, techConObjectsCode, isDop, isNewRP : Integer;
    so2distrCode : Integer;
    personalAccountNumber : string;

end;

var
  frmENDistributionAgreeEdit: TfrmENDistributionAgreeEdit;
  ENDistributionAgreeObj: ENDistributionAgree;
  ENSO2DistrAgreeObj: ENSO2DistrAgree;

implementation

uses ENConsts, ENServicesObjectController, DMReportsUnit, ShowENWarrant,
  ENWarrantController, CCRecordPointController, ShowCCRecordPointLite,
  ENTechConditionsObjectsController;


{uses  
    EnergyproController, EnergyproController2, ENDistributionAgreeController  ;
}
{$R *.dfm}



procedure TfrmENDistributionAgreeEdit.FormCreate(Sender: TObject);
begin
      soCode := LOW_INT;
      tcsCode := LOW_INT;
      personalAccountNumber := '';
      ENDistributionAgreeObj := ENDistributionAgree.Create;
      isDop := 0;
      isNewRP := 0;
end;

procedure TfrmENDistributionAgreeEdit.FormShow(Sender: TObject);
 var
  TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
  TempENDistrAgree : ENDistributionAgreeControllerSoapPort;
  TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
  ENTechCondObj : ENTechConditionsObjects;
  so2distrFilter : ENSO2DistrAgreeFilter;
  so2distrList : ENSO2DistrAgreeShortList;
  TempENWarrant : ENWarrantControllerSoapPort;
  warrant : ENWarrant;
begin

  if (DialogState = dsInsert) then
  begin
    HideControls([btnPrint, btnPrintAgree, btnPrintD1, btnPrintD2, btnPrintD3,
                  btnPrintD4, btnPrintD5, btnPrintD6, btnPrintD7, btnPrintD8, btnPrintDop]);

    // объект Ту по контрагенту для инсёрта
    TempENTechConditionsObjects :=  HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
    ENTechCondObj:= TempENTechConditionsObjects.getObject(techConObjectsCode);

    edtObjectname.Text := ENTechCondObj.building;
    edtObjectaddress.Text := ENTechCondObj.address;
    edtD7linesource.Text := ENTechCondObj.connectionSource;
    edtD5feederlist.Text := ENTechCondObj.connectionSource+ '; '+ENTechCondObj.connectionPowerPlaces;

    if ( ENTechCondObj.tyServicesPower <> nil ) then
       edtPower.Text := ENTechCondObj.tyServicesPower.decimalString
    else
       edtPower.Text := '';
    ///

  end;


  if so2distrCode <> LOW_INT then
  begin
    TempENSO2DistrAgree := HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;
    TempENDistrAgree := HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;

      try
        ENSO2DistrAgreeObj := TempENSO2DistrAgree.getObject(so2distrCode);
      except
        on EConvertError do Exit;
      end;

      try
        ENDistributionAgreeObj := TempENDistrAgree.getObject(ENSO2DistrAgreeObj.distrAgree.code);
      except
        on EConvertError do Exit;
      end;

  end;


  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPower
      ,edtObjectname
      ,edtObjectaddress
      ,edtEic
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENDistributionAgreeObj.code);
    edtEic.Text := ENDistributionAgreeObj.eic; 
    MakeMultiline(edtObjectname.Lines, ENDistributionAgreeObj.objectname);
    MakeMultiline(edtObjectaddress.Lines, ENDistributionAgreeObj.objectaddress);
    if ( ENDistributionAgreeObj.power <> nil ) then
       edtPower.Text := ENDistributionAgreeObj.power.decimalString
    else
       edtPower.Text := '';
    edtD2fuse.Text := ENDistributionAgreeObj.d2fusename;
    MakeMultiline(edtD3countername.Lines, ENDistributionAgreeObj.d3countername);
    MakeMultiline(edtD3countertype.Lines, ENDistributionAgreeObj.d3countertype);
    if ( ENDistributionAgreeObj.d3amperageratio <> nil ) then
       edtD3amperageratio.Text := ENDistributionAgreeObj.d3amperageratio.decimalString
    else
       edtD3amperageratio.Text := '';
    if ( ENDistributionAgreeObj.d3voltageratio <> nil ) then
       edtD3voltageratio.Text := ENDistributionAgreeObj.d3voltageratio.decimalString
    else
       edtD3voltageratio.Text := '';
    if ( ENDistributionAgreeObj.d3totalratio <> nil ) then
       edtD3totalratio.Text := ENDistributionAgreeObj.d3totalratio.decimalString
    else
       edtD3totalratio.Text := '';
    MakeMultiline(edtD3place.Lines, ENDistributionAgreeObj.d3place);
    edtD3voltageclass.Text := ENDistributionAgreeObj.d3voltageclass;
    edtD3workmode.Text := ENDistributionAgreeObj.d3workmode; 
    edtD3tarifftype.Text := ENDistributionAgreeObj.d3tarifftype; 
    edtD3accountingtype.Text := ENDistributionAgreeObj.d3accountingtype; 
    edtD5feederlist.Text := ENDistributionAgreeObj.d5feederlist; 
    edtD6reliabilitypue.Text := ENDistributionAgreeObj.d6reliabilitypue;
    edtD6reliabilityguaranteed.Text := ENDistributionAgreeObj.d6reliabilityguaranteed;
    edtD6balancesupplier.Text :=  ENDistributionAgreeObj.d6balancesupplier;
    edtD6balanceclient.Text := ENDistributionAgreeObj.d6balanceclient;
    edtD6BalanceLimit.Text := ENDistributionAgreeObj.d6balancelimit;
    MakeMultiline(edtD6responsibilitysupplier.Lines, ENDistributionAgreeObj.d6responsibilitysupplier);
    MakeMultiline(edtD6responsibilityclient.Lines, ENDistributionAgreeObj.d6responsibilityclient);
    MakeMultiline(edtD7linesource.Lines, ENDistributionAgreeObj.d7linesource);
    MakeMultiline(edtD7attachment.Lines, ENDistributionAgreeObj.d7attachment);
    MakeMultiline(edtD8conditions.Lines, ENDistributionAgreeObj.d8conditions);
    MakeMultiline(edtD8transformertype.Lines, ENDistributionAgreeObj.d8transformertype);
    if ( ENDistributionAgreeObj.d8voltagebh <> nil ) then
       edtD8voltagebh.Text := ENDistributionAgreeObj.d8voltagebh.decimalString
    else
       edtD8voltagebh.Text := '';
    if ( ENDistributionAgreeObj.d8voltagehh <> nil ) then
       edtD8voltagehh.Text := ENDistributionAgreeObj.d8voltagehh.decimalString
    else
       edtD8voltagehh.Text := '';
    if ( ENDistributionAgreeObj.d8lossesxx <> nil ) then
       edtD8lossesxx.Text := ENDistributionAgreeObj.d8lossesxx.decimalString
    else
       edtD8lossesxx.Text := '';
    if ( ENDistributionAgreeObj.d8losseskz <> nil ) then
       edtD8losseskz.Text := ENDistributionAgreeObj.d8losseskz.decimalString
    else
       edtD8losseskz.Text := '';
    if ( ENDistributionAgreeObj.d8amperage <> nil ) then
       edtD8amperage.Text := ENDistributionAgreeObj.d8amperage.decimalString
    else
       edtD8amperage.Text := '';
    if ( ENDistributionAgreeObj.d8voltagekz <> nil ) then
       edtD8voltagekz.Text := ENDistributionAgreeObj.d8voltagekz.decimalString
    else
       edtD8voltagekz.Text := '';
    if ( ENDistributionAgreeObj.d8linelength <> nil ) then
       edtD8linelength.Text := ENDistributionAgreeObj.d8linelength.decimalString
    else
       edtD8linelength.Text := '';
    if ( ENDistributionAgreeObj.d8liner <> nil ) then
       edtD8liner.Text := ENDistributionAgreeObj.d8liner.decimalString
    else
       edtD8liner.Text := '';
    if ( ENDistributionAgreeObj.d8linex <> nil ) then
       edtD8linex.Text := ENDistributionAgreeObj.d8linex.decimalString
    else
       edtD8linex.Text := '';
    if ( ENDistributionAgreeObj.d8hours <> Low(Integer) ) then
       edtD8hours.Text := IntToStr(ENDistributionAgreeObj.d8hours)
    else
       edtD8hours.Text := '';

    if (ENDistributionAgreeObj.numberGen <> '') then
       edtContractNumber.Text := ENDistributionAgreeObj.numberGen;

    if ENDistributionAgreeObj.dateGen <> nil then
    begin
      edtContractDate.DateTime:=EncodeDate(ENDistributionAgreeObj.dateGen.Year,ENDistributionAgreeObj.dateGen.Month,ENDistributionAgreeObj.dateGen.Day);
      edtContractDate.checked := true;
    end
    else
    begin
      edtContractDate.DateTime:=SysUtils.Date;
      edtContractDate.checked := false;
    end;

       if ((ENDistributionAgreeObj.warrantRef <> nil) and ( ENDistributionAgreeObj.warrantRef.code <> Low(Integer))) then
    begin
       TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
       warrant := TempENWarrant.getObject(ENDistributionAgreeObj.warrantRef.code);
       edtWarrantFIO.Text := warrant.warrantShortFIO;
       edtWarrantNumber.Text := warrant.numbergen;
    end;

  end;
end;



procedure TfrmENDistributionAgreeEdit.rgDopTypeClick(Sender: TObject);
begin
  inherited;
  if rgDopType.ItemIndex = 0 then
  isNewRP := 1
  else if rgDopType.ItemIndex = 1 then
  isNewRP := 0;

end;

procedure TfrmENDistributionAgreeEdit.btnPrintAgreeClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);

    reportName := 'DistributionAgree/distrAgree';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 1);
    SetLength(args, 1);

  argNames[0] := 'agreeCode';
  args[0] := IntToStr(tcsCode);

      reportName := 'DistributionAgree/distrAgree';
      makeReport(reportName , argNames , args , 'doc');

   if isDop = 1 then
   begin
    SetLength(argNames, 2);
    SetLength(args, 2);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);
   end;

      reportName := 'DistributionAgree/dodatok_1';
      makeReport(reportName , argNames , args , 'doc');
      reportName := 'DistributionAgree/dodatok_2';
      makeReport(reportName , argNames , args , 'doc');
      reportName := 'DistributionAgree/dodatok_3';
      makeReport(reportName , argNames , args , 'doc');
      reportName := 'DistributionAgree/dodatok_4';
      makeReport(reportName , argNames , args , 'doc');
      reportName := 'DistributionAgree/dodatok_5';
      makeReport(reportName , argNames , args , 'doc');
      reportName := 'DistributionAgree/dodatok_6';
      makeReport(reportName , argNames , args , 'doc');
      reportName := 'DistributionAgree/dodatok_7';
      makeReport(reportName , argNames , args , 'doc');
      reportName := 'DistributionAgree/dodatok_8';
      makeReport(reportName , argNames , args , 'doc');

end;

procedure TfrmENDistributionAgreeEdit.btnPrintD1Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_1';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintD2Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_2';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintD3Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_3';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintD4Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_4';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintD5Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_5';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintD6Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_6';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintD7Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_7';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintD8Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isDop';
    args[1] := IntToStr(isDop);

    reportName := 'DistributionAgree/dodatok_8';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnPrintDopClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'agreeCode';
    args[0] := IntToStr(tcsCode);
    argNames[1] := 'isNewRP';
    args[1] := IntToStr(isNewRP);

    reportName := 'DistributionAgree/distrAgree_dop';
    makeReport(reportName , argNames , args , 'doc');
end;

procedure TfrmENDistributionAgreeEdit.btnspbeicClick(Sender: TObject);
var
  TempCCRecordPointLite: CCRecordPointControllerSoapPort;
  RecordPointFilterObj: CCRecordPointFilter;
  TempCCRecordPoint: CCRecordPointControllerSoapPort;

  begin
  inherited;


        RecordPointFilterObj:=CCRecordPointFilter.Create;
        SetNullIntProps(RecordPointFilterObj);
        SetNullXSProps(RecordPointFilterObj);

        TempCCRecordPoint :=  HTTPRIOCCRecordPoint as CCRecordPointControllerSoapPort;

        RecordPointFilterObj.conditionSQL := ' CCCUSTOMER.accountnumber = ' + Chr(39) + personalAccountNumber +Chr(39) ;
        RecordPointFilterObj.orderBySQL := ' ccrecordpoint.eic ';

        frmCCRecordPointShowLite:=TfrmCCRecordPointShowLite.Create(Application,fmNormal, RecordPointFilterObj);
        TempCCRecordPointLite :=  HTTPRIOCCRecordPoint as CCRecordPointControllerSoapPort;
   try
      with frmCCRecordPointShowLite do begin
        if ShowModal = mrOk then
        begin
            try

               edteic.Text := GetReturnValue(sgCCRecordPoint,8);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmCCRecordPointShowLite.Free;
   end;
end;

procedure TfrmENDistributionAgreeEdit.btnWarrantNumberClick(Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    datContract, datWarrant : TXSDate;

begin

     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.conditionSQL := ' warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try
                 if ENDistributionAgreeObj = nil then
                  begin
                    ENDistributionAgreeObj := ENDistributionAgree.Create;
                    SetNullIntProps(ENDistributionAgreeObj);
                    SetNullXSProps(ENDistributionAgreeObj);
                  end;

                  ENDistributionAgreeObj.warrantRef := ENWarrantRef.Create();
                  ENDistributionAgreeObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  edtWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
                  edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;

end;

procedure TfrmENDistributionAgreeEdit.chkPrintDopClick(Sender: TObject);
begin
  inherited;
  if chkPrintDop.Checked then
  isDop := 1
  else if chkPrintDop.Checked = False
  then isDop := 0;

end;

procedure TfrmENDistributionAgreeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDistributionAgree: ENDistributionAgreeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtPower
      ,edtObjectname
      ,edtObjectaddress
      ,edtEic
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDistributionAgree := HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;


     ENDistributionAgreeObj.eic := edtEic.Text; 

     ENDistributionAgreeObj.objectname := edtObjectname.Text; 

     ENDistributionAgreeObj.objectaddress := edtObjectaddress.Text; 

     if (ENDistributionAgreeObj.power = nil ) then
       ENDistributionAgreeObj.power := TXSDecimal.Create;
     if edtPower.Text <> '' then
       ENDistributionAgreeObj.power.decimalString := edtPower.Text 
     else
       ENDistributionAgreeObj.power := nil;

     ENDistributionAgreeObj.d2fusename := edtD2fuse.Text;

     ENDistributionAgreeObj.d3countername := edtD3countername.Text; 

     ENDistributionAgreeObj.d3countertype := edtD3countertype.Text; 

     if (ENDistributionAgreeObj.d3amperageratio = nil ) then
       ENDistributionAgreeObj.d3amperageratio := TXSDecimal.Create;
     if edtD3amperageratio.Text <> '' then
       ENDistributionAgreeObj.d3amperageratio.decimalString := edtD3amperageratio.Text 
     else
       ENDistributionAgreeObj.d3amperageratio := nil;

     if (ENDistributionAgreeObj.d3voltageratio = nil ) then
       ENDistributionAgreeObj.d3voltageratio := TXSDecimal.Create;
     if edtD3voltageratio.Text <> '' then
       ENDistributionAgreeObj.d3voltageratio.decimalString := edtD3voltageratio.Text 
     else
       ENDistributionAgreeObj.d3voltageratio := nil;

     if (ENDistributionAgreeObj.d3totalratio = nil ) then
       ENDistributionAgreeObj.d3totalratio := TXSDecimal.Create;
     if edtD3totalratio.Text <> '' then
       ENDistributionAgreeObj.d3totalratio.decimalString := edtD3totalratio.Text 
     else
       ENDistributionAgreeObj.d3totalratio := nil;

     ENDistributionAgreeObj.d3place := edtD3place.Text; 

     ENDistributionAgreeObj.d3voltageclass := edtD3voltageclass.Text; 

     ENDistributionAgreeObj.d3workmode := edtD3workmode.Text; 

     ENDistributionAgreeObj.d3tarifftype := edtD3tarifftype.Text; 

     ENDistributionAgreeObj.d3accountingtype := edtD3accountingtype.Text; 

     ENDistributionAgreeObj.d5feederlist := edtD5feederlist.Text; 

     ENDistributionAgreeObj.d6reliabilitypue := edtD6reliabilitypue.Text; 

     ENDistributionAgreeObj.d6reliabilityguaranteed := edtD6reliabilityguaranteed.Text; 

     ENDistributionAgreeObj.d6balancesupplier := edtD6balancesupplier.Text; 

     ENDistributionAgreeObj.d6balanceclient := edtD6balanceclient.Text; 

     ENDistributionAgreeObj.d6responsibilitysupplier := edtD6responsibilitysupplier.Text; 

     ENDistributionAgreeObj.d6responsibilityclient := edtD6responsibilityclient.Text;

     ENDistributionAgreeObj.d6balancelimit := edtD6BalanceLimit.Text;

     ENDistributionAgreeObj.d7linesource := edtD7linesource.Text;

     ENDistributionAgreeObj.d8conditions := edtD8conditions.Text; 

     ENDistributionAgreeObj.d8transformertype := edtD8transformertype.Text; 

     if (ENDistributionAgreeObj.d8voltagebh = nil ) then
       ENDistributionAgreeObj.d8voltagebh := TXSDecimal.Create;
     if edtD8voltagebh.Text <> '' then
       ENDistributionAgreeObj.d8voltagebh.decimalString := edtD8voltagebh.Text 
     else
       ENDistributionAgreeObj.d8voltagebh := nil;

     if (ENDistributionAgreeObj.d8voltagehh = nil ) then
       ENDistributionAgreeObj.d8voltagehh := TXSDecimal.Create;
     if edtD8voltagehh.Text <> '' then
       ENDistributionAgreeObj.d8voltagehh.decimalString := edtD8voltagehh.Text 
     else
       ENDistributionAgreeObj.d8voltagehh := nil;

     if (ENDistributionAgreeObj.d8lossesxx = nil ) then
       ENDistributionAgreeObj.d8lossesxx := TXSDecimal.Create;
     if edtD8lossesxx.Text <> '' then
       ENDistributionAgreeObj.d8lossesxx.decimalString := edtD8lossesxx.Text 
     else
       ENDistributionAgreeObj.d8lossesxx := nil;

     if (ENDistributionAgreeObj.d8losseskz = nil ) then
       ENDistributionAgreeObj.d8losseskz := TXSDecimal.Create;
     if edtD8losseskz.Text <> '' then
       ENDistributionAgreeObj.d8losseskz.decimalString := edtD8losseskz.Text 
     else
       ENDistributionAgreeObj.d8losseskz := nil;

     if (ENDistributionAgreeObj.d8amperage = nil ) then
       ENDistributionAgreeObj.d8amperage := TXSDecimal.Create;
     if edtD8amperage.Text <> '' then
       ENDistributionAgreeObj.d8amperage.decimalString := edtD8amperage.Text 
     else
       ENDistributionAgreeObj.d8amperage := nil;

     if (ENDistributionAgreeObj.d8voltagekz = nil ) then
       ENDistributionAgreeObj.d8voltagekz := TXSDecimal.Create;
     if edtD8voltagekz.Text <> '' then
       ENDistributionAgreeObj.d8voltagekz.decimalString := edtD8voltagekz.Text 
     else
       ENDistributionAgreeObj.d8voltagekz := nil;

     if (ENDistributionAgreeObj.d8linelength = nil ) then
       ENDistributionAgreeObj.d8linelength := TXSDecimal.Create;
     if edtD8linelength.Text <> '' then
       ENDistributionAgreeObj.d8linelength.decimalString := edtD8linelength.Text 
     else
       ENDistributionAgreeObj.d8linelength := nil;

     if (ENDistributionAgreeObj.d8liner = nil ) then
       ENDistributionAgreeObj.d8liner := TXSDecimal.Create;
     if edtD8liner.Text <> '' then
       ENDistributionAgreeObj.d8liner.decimalString := edtD8liner.Text 
     else
       ENDistributionAgreeObj.d8liner := nil;

     if (ENDistributionAgreeObj.d8linex = nil ) then
       ENDistributionAgreeObj.d8linex := TXSDecimal.Create;
     if edtD8linex.Text <> '' then
       ENDistributionAgreeObj.d8linex.decimalString := edtD8linex.Text 
     else
       ENDistributionAgreeObj.d8linex := nil;

     if ( edtD8hours.Text <> '' ) then
       ENDistributionAgreeObj.d8hours := StrToInt(edtD8hours.Text)
     else
       ENDistributionAgreeObj.d8hours := Low(Integer) ;

       ENDistributionAgreeObj.numberGen := edtContractNumber.Text;

     if edtcontractDate.checked then
     begin
       if ENDistributionAgreeObj.dateGen = nil then
          ENDistributionAgreeObj.dateGen := TXSDateTime.Create;
       ENDistributionAgreeObj.dateGen.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end;

    if DialogState = dsInsert then
    begin
      ENDistributionAgreeObj.code:=low(Integer);
      TempENDistributionAgree.add(ENDistributionAgreeObj, soCode);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDistributionAgree.save(ENDistributionAgreeObj);
    end;
  end;
end;


end.