
unit EditENBuilding;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENBuildingController, ShowENElement,
  ENElementController, ShowENInvestProgramGroups,
  ENInvestProgramGroupsController, AdvObj, ENActController, ShowENAct,
  ENBuilding2ENactController, ENConsts , ENBuilding2OSDataController, ExtCtrls,
  TB2Item, TB2Dock, TB2Toolbar;

type
  TfrmENBuildingEdit = class(TDialogForm)
    PageControl1: TPageControl;
    tsMain: TTabSheet;
    tsBuilding2Act: TTabSheet;
    lblNumbergen: TLabel;
    lblDateGen: TLabel;
    lblSummaGen: TLabel;
    lblCharacteristic: TLabel;
    lblCode: TLabel;
    edtNumbergen: TEdit;
    edtDateGen: TDateTimePicker;
    edtSummaGen: TEdit;
    edtCharacteristic: TMemo;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    v: TGroupBox;
    lblInvNumber: TLabel;
    spbOSSelect: TSpeedButton;
    lblNameOZ: TLabel;
    edtInvNumberOZ: TEdit;
    HTTPRIOENBuilding: THTTPRIO;
    grpisInvest: TGroupBox;
    lblYearInvestProgram: TLabel;
    lblItemInvestProgram: TLabel;
    spbInvestProgramGroups: TSpeedButton;
    lblRazdelInvProgram: TLabel;
    edtYearInvestProgram: TEdit;
    edtItemInvestProgram: TEdit;
    edtInvestProgramGroupsName: TEdit;
    chkisInvestProgram: TCheckBox;
    lblDecreeNumber: TLabel;
    lblDecreeDate: TLabel;
    edtDecreeDate: TDateTimePicker;
    edtBuildingAddress: TEdit;
    lblBuildingAddress: TLabel;
    edtDecreeNumber: TEdit;
    lblExploitationTerm: TLabel;
    edtExploitationTerm: TEdit;
    lblDateLoadExpl: TLabel;
    edtDateLoadExpl: TDateTimePicker;
    edtDateBuild: TDateTimePicker;
    lblDateBuild: TLabel;
    HTTPRIOENInvestProgramGroups: THTTPRIO;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ImageList1: TImageList;
    PopupMenu2: TPopupMenu;
    miisCalculationDateTrue: TMenuItem;
    miisCalculationDateFalse: TMenuItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    actUpdateGridAct: TAction;
    actUpdateGridActProject: TAction;
    actInsertDateForActProject: TAction;
    actUpdateGridDateForActProject: TAction;
    actDeleteDateForActProject: TAction;
    actisCalculationDateTrue: TAction;
    actisCalculationDateFalse: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    HTTPRIOENBuilding2ENact: THTTPRIO;
    ppMenuAddAct: TPopupMenu;
    addActFromEnergynet: TMenuItem;
    addActNotFromEnergynet: TMenuItem;
    actUpdateENbuilding2Act: TAction;
    sgENBuilding2ENact: TAdvStringGrid;
    spbDepartment: TSpeedButton;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    HTTPRIOENDepartment: THTTPRIO;
    tsBuhData: TTabSheet;
    edtOSIstCode: TEdit;
    edtOSSum_st_perv_n: TEdit;
    edtOSKod_nal_nakl: TEdit;
    edtOSKod_inv: TEdit;
    edtOSNum_un: TEdit;
    memOSCharacters: TMemo;
    edtOSPrimechan: TEdit;
    edtOSKod_oborud: TEdit;
    edtOSKod_zatr: TEdit;
    dtpOSDt_vypusk: TDateTimePicker;
    edtOSSum_izn_perv_n: TEdit;
    edtOSSum_izn_perv: TEdit;
    rdbOSF_amortN: TRadioButton;
    rdbOSF_amortY: TRadioButton;
    btnOSDataCancel: TBitBtn;
    btnOSDataSave: TBitBtn;
    btnOSDataEdit: TBitBtn;
    edtOSKlassCode: TEdit;
    edtOSGrCode: TEdit;
    edtOSPrivatCode: TEdit;
    edtOSVidCode: TEdit;
    edtOSSubschCode: TEdit;
    edtOSKlass: TEdit;
    edtOSGr: TEdit;
    edtOSPrivat: TEdit;
    edtOSVid: TEdit;
    edtOSSubsch: TEdit;
    edtOSIst: TEdit;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    spbOSKlassClear: TSpeedButton;
    spbOSGrClear: TSpeedButton;
    spbOSPrivatClear: TSpeedButton;
    spbOSVidClear: TSpeedButton;
    spbOSSubschClear: TSpeedButton;
    spbOSIstClear: TSpeedButton;
    Label9: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    spbOSKlass: TSpeedButton;
    spbOSGr: TSpeedButton;
    spbOSPrivat: TSpeedButton;
    spbOSVid: TSpeedButton;
    spbOSSubsch: TSpeedButton;
    spbOSIst: TSpeedButton;
    HTTPRIOENBuilding2OSData: THTTPRIO;
    btnPrintOrder: TButton;
    dtpOSDt_posting: TDateTimePicker;
    lblDatePostingOZ: TLabel;
    edtCodePodr: TEdit;
    Label2: TLabel;
    edtCodeMol: TEdit;
    Label1: TLabel;
    spbPlanMOL: TSpeedButton;
    tsPrintinfo: TTabSheet;
    Panel1: TPanel;
    ActionListCommission: TActionList;
    actViewcommission: TAction;
    actInsertcommission: TAction;
    actDeletecommission: TAction;
    actEditcommission: TAction;
    actUpdatecommission: TAction;
    actFiltercommission: TAction;
    actNoFiltercommission: TAction;
    PopupMenuCommission: TPopupMenu;
    ppviewcommission: TMenuItem;
    ppinsertcommission: TMenuItem;
    ppdeletecommission: TMenuItem;
    ppeditcommission: TMenuItem;
    ppupdatecommission: TMenuItem;
    ppfiltercommission: TMenuItem;
    ppnofiltercommission: TMenuItem;
    HTTPRIOENBuilding2Commission: THTTPRIO;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENBuilding2Commission: TAdvStringGrid;
    edtNameOZ: TEdit;
    edtServicesName: TEdit;
    lblServicesName: TLabel;
    spbENServicesObject: TSpeedButton;
    HTTPRIOENServicesObject: THTTPRIO;
    GroupBox1: TGroupBox;
    tbActions: TTBToolbar;
    tbContractAdd: TTBItem;
    tbContractDelete: TTBItem;
    HTTPRIOENBuilding2ServicesObject: THTTPRIO;
    sgENBuilding2ServicesObject: TAdvStringGrid;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbOSSelectClick(Sender: TObject);
    procedure spbInvestProgramGroupsClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateGridActExecute(Sender: TObject);

    function  getSummaGenByOZ1(codeOz : integer):Double;
    function  getcontractpriceByOZ1(codeOz : integer):Double;
    procedure addActFromEnergynetClick(Sender: TObject);
    procedure addActNotFromEnergynetClick(Sender: TObject);
    procedure actUpdateENbuilding2ActExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbOSIstClick(Sender: TObject);
    procedure spbOSIstClearClick(Sender: TObject);
    procedure spbOSSubschClick(Sender: TObject);
    procedure spbOSSubschClearClick(Sender: TObject);
    procedure spbOSVidClick(Sender: TObject);
    procedure spbOSPrivatClearClick(Sender: TObject);
    procedure spbOSVidClearClick(Sender: TObject);
    procedure spbOSPrivatClick(Sender: TObject);
    procedure spbOSGrClick(Sender: TObject);
    procedure spbOSGrClearClick(Sender: TObject);
    procedure spbOSKlassClick(Sender: TObject);
    procedure spbOSKlassClearClick(Sender: TObject);
    procedure LockUnlockOSData(lock: Boolean = true);
    procedure btnOSDataEditClick(Sender: TObject);
    procedure btnOSDataSaveClick(Sender: TObject);
    procedure updateOSDataTab();
    procedure btnOSDataCancelClick(Sender: TObject);
    procedure btnPrintOrderClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure actViewcommissionExecute(Sender: TObject);
    procedure actInsertcommissionExecute(Sender: TObject);
    procedure actDeletecommissionExecute(Sender: TObject);
    procedure actUpdatecommissionExecute(Sender: TObject);

    procedure UpdateGridsgENBuilding2Commission(Sender: TObject);
    procedure actEditcommissionExecute(Sender: TObject);
    procedure spbENServicesObjectClick(Sender: TObject);
    procedure tbContractAddClick(Sender: TObject);

    procedure UpdateGridsgENBuilding2ServicesObject(Sender: TObject);
    procedure tbContractDeleteClick(Sender: TObject);
  
  private
    { Private declarations }
    AllowClose: Boolean;
    OSData: ENBuilding2OSData;
  public
    { Public declarations }
    statusCode, orgID : Integer;
    numberDoc: String;

end;

var
  frmENBuildingEdit: TfrmENBuildingEdit;
  ENBuildingObj: ENBuilding;

implementation

uses EditENActProj2OZ2, EditENBuilding2ENact, ShowENDepartment,
  ENDepartmentController, ShowOSIst, OSIstController, ShowOSSubsch,
  OSSubschController, ShowOSVid, ShowOSPrivat, OSPrivatController, ShowOSGr,
  ShowOSKlass, EnergyproController, DMReportsUnit, FINMolController, ShowFINMol,
  ENBuilding2CommissionController, EditENBuilding2Commission,
  ShowENServicesConnection, ENServicesObjectController,
  ENServicesContractKindController, ENServicesContractTypeController, ENActAdd,
  ENBuilding2ServicesObjectController;



{$R *.dfm}

           var
        ENBuilding2ENactHeaders: array [1..11] of String =
        ( 'Код'
          ,'сума по расходному акту'
          ,'НДС по расходному акту'
          ,'Признак  учитывать или нет даты по наряд заданиям для документа Нове будівництво(0/1)'
          ,'Номер договору ФИН'
          ,'Дата додговору фин'
          ,'Найменування організації'
          ,'код організації'
          ,'true-акт с EnergyNET false - акт ручной'
          ,'№ акта '
          ,'Дата акта'
        );

        ENBuilding2CommissionHeaders: array [1..6] of String =
        ( 'Код'
          ,'Табельний номер'
          ,'П.І.Б члена коміссії'
          ,'П.І.Б члена коміссії (скорочено)'
          ,'Посада'
          ,'Тип запису'
        );

        ENBuilding2ServicesObjectHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата додговору'
          ,'Найменування організації'
          ,'код організації'
        );

procedure TfrmENBuildingEdit.FormShow(Sender: TObject);

var
investObj : ENInvestProgramGroups;
TempENInvestProgramGroups : ENInvestProgramGroupsControllerSoapPort;
TempENDepartment: ENDepartmentControllerSoapPort;
TempENServicesObject : ENServicesObjectControllerSoapPort;
so : ENServicesObject;
begin

  SetFloatStyle([edtSummaGen , edtExploitationTerm]);

  if (DialogState = dsInsert) then
  begin
    tsBuilding2Act.TabVisible:= false;
    tsBuhData.TabVisible:= false;
    tbActions.Enabled:= false;
  end;


  DisableControls([
        edtCode
      ,edtOSIstCode, edtOSIst
      ,edtOSSubschCode, edtOSSubsch
      ,edtOSVidCode, edtOSVid
      ,edtOSPrivatCode, edtOSPrivat
      ,edtOSGrCode, edtOSGr
      ,edtOSKlassCode, edtOSKlass
      ,rdbOSF_amortY, rdbOSF_amortN
      ,dtpOSDt_vypusk
      ,edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n
      ,edtOSKod_zatr, edtOSKod_oborud
      ,edtOSPrimechan, memOSCharacters
      ,edtOSKod_nal_nakl
      ,edtOSNum_un, edtOSKod_inv
      ,dtpOSDt_posting
      ,edtServicesName
   ]);

  PageControl1.ActivePage := tsMain;

  DisableControls([edtInvNumberOZ ,edtDepartment]);
  if DialogState = dsView then
  begin
     DisableControls([spbENServicesObject]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen ,
      edtExploitationTerm
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBuildingObj.code);
    edtNumbergen.Text := ENBuildingObj.numbergen; 
    SetDateFieldForDateTimePicker(edtDateGen, ENBuildingObj.dateGen);

    SetTXSDecimalForTEdit(edtSummaGen, ENBuildingObj.summaGen);
    //SetTXSDecimalForTEdit(edtSummaNDS, ENBuildingObj.summaNDS);
    MakeMultiline(edtCharacteristic.Lines, ENBuildingObj.characteristic);
    //edtExecutedPosition.Text := ENBuildingObj.executedPosition;
    //edtExecutedName.Text := ENBuildingObj.executedName;
    //edtAcceptedPosition.Text := ENBuildingObj.ascceptedPosition;
    //edtAcceptedName.Text := ENBuildingObj.acceptedName;
    //SetTXSDecimalForTEdit(edtContractPrice, ENBuildingObj.contractPrice);
    edtCodeMol.Text := ENBuildingObj.codeMol;
    edtCodePodr.Text := ENBuildingObj.codePodr;
    edtInvNumberOZ.Text := ENBuildingObj.invNumberOZ;
    edtNameOZ.Text := ENBuildingObj.nameOZ;

   if ( ENBuildingObj.isInvestProgram <> Low(Integer) ) then
      if ( ENBuildingObj.isInvestProgram <> 0 ) then
       chkisInvestProgram.Checked := True
    else
       chkisInvestProgram.Checked := False;


    edtYearInvestProgram.Text := ENBuildingObj.yearInvestProgram; 
    edtItemInvestProgram.Text := ENBuildingObj.itemInvestProgram;

    edtBuildingAddress.Text := ENBuildingObj.buildingAddress;

    edtDecreeNumber.Text := ENBuildingObj.decreeNumber;


    SetDateFieldForDateTimePicker(edtDecreeDate, ENBuildingObj.decreeDate);
    if ( ENBuildingObj.exploitationTerm <> Low(Integer) ) then
       edtExploitationTerm.Text := IntToStr(ENBuildingObj.exploitationTerm)
    else
       edtExploitationTerm.Text := '';
    SetDateFieldForDateTimePicker(edtDateLoadExpl, ENBuildingObj.dateLoadExpl);
    SetDateFieldForDateTimePicker(edtDateBuild, ENBuildingObj.dateBuild);

    if ENBuildingObj.departmentRef <> nil then
     if ENBuildingObj.departmentRef.code <> low(Integer) then
     begin
       TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
       edtDepartment.Text := TempENDepartment.getObject(ENBuildingObj.departmentRef.code).shortName;
     end;





     if ENBuildingObj.invgroupRef = nil then
       ENBuildingObj.invgroupRef := ENInvestProgramGroupsRef.Create
    else
    if ENBuildingObj.invgroupRef.code > Low(Integer) then
    begin
         try
             TempENInvestProgramGroups :=  HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
             investObj := TempENInvestProgramGroups.getObject(ENBuildingObj.invgroupRef.code);
             if investObj <> nil then
             begin
                 edtInvestProgramGroupsName.Text := investObj.name;
             end;
         finally

         end;
    end;

    statusCode := ENBuildingObj.statusRef.code;
    // Редактировать бух. данные даем только в статусе "Складений" и черновой
   DisableControls([btnOSDataEdit],  not ( ( statusCode in [ENBUILDING_STATUS_SIGNED , ENBUILDING_STATUS_DRAFT]) or (HTTPRIOenbuilding.HTTPWebNode.UserName = 'energynet' ) ));


//   if ENBuildingObj.servicesobject.code <> Low_int then
//     begin
//      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
//      so := TempENServicesObject.getObject(ENBuildingObj.servicesobject.code);
//      edtServicesName.Text := so.contractNumberServices + ' | ' + so.contragentName;
//     end;

     UpdateGridsgENBuilding2ServicesObject(Sender);
  end;
     if (DialogState = dsView) then
     begin
      DisableControls([spbOSSelect,spbDepartment ,spbPlanMOL , spbInvestProgramGroups, tbActions ]);
     end;

end;



procedure TfrmENBuildingEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin
            try
               if ENBuildingObj.departmentRef= nil then ENBuildingObj.departmentRef := ENDepartmentRef.Create();
               ENBuildingObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;

               edtCodePodr.Text:= DMReports.getFINCehCodeByDepartmentCode( ENBuildingObj.departmentRef.code );

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENBuildingEdit.spbENServicesObjectClick(Sender: TObject);
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

    DisableActions([frmShowENServicesConnection.actNoFilter, frmShowENServicesConnection.actEdit]);
  try
		with frmShowENServicesConnection do
			if ShowModal = mrOk then begin

				try
					servicesObjectCode := StrToInt(GetReturnValue(sgENServicesObject,0));
        except on EConvertError do Exit;
				end;

        ENBuildingObj.servicesobject := ENServicesObjectRef.Create;
        ENBuildingObj.servicesobject.code := servicesObjectCode;

        //edtServicesName.Text := GetReturnValue(sgENServicesObject,1) + ' | ' + GetReturnValue(sgENServicesObject,5);

			end;
	finally
        frmShowENServicesConnection.Free;
     end;
end;

procedure TfrmENBuildingEdit.spbInvestProgramGroupsClick(Sender: TObject);
var
   frmENInvestProgramGroupsShow : TfrmENInvestProgramGroupsShow;
   f : ENInvestProgramGroupsFilter;
begin
   f := ENInvestProgramGroupsFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal, f);

   try
      with frmENInvestProgramGroupsShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENBuildingObj.invgroupRef = nil then ENBuildingObj.invgroupRef := ENInvestProgramGroupsRef.Create();
               ENBuildingObj.invgroupRef.code := StrToInt(GetReturnValue(sgENInvestProgramGroups,0));
               edtInvestProgramGroupsName.Text := GetReturnValue(sgENInvestProgramGroups,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENInvestProgramGroupsShow.Free;
   end;

end;

procedure TfrmENBuildingEdit.spbOSGrClearClick(Sender: TObject);
begin
  ClearControls([edtOSKlassCode, edtOSKlass]);
end;

procedure TfrmENBuildingEdit.spbOSGrClick(Sender: TObject);
var
  frmOSGrShow: TfrmOSGrShow;
begin
  frmOSGrShow := TfrmOSGrShow.Create(Application, fmNormal);
  try
    with frmOSGrShow do
      if ShowModal = mrOk then
      begin
        edtOSGrCode.Text := GetReturnValue(sgOSGr, 1);
        edtOSGr.Text := GetReturnValue(sgOSGr, 2);
      end;
  finally
    frmOSGrShow.Free;
  end;
end;

procedure TfrmENBuildingEdit.spbOSIstClearClick(Sender: TObject);
begin
  ClearControls([edtOSIstCode, edtOSIst]);

end;

procedure TfrmENBuildingEdit.spbOSIstClick(Sender: TObject);
var
  frmOSIstShow: TfrmOSIstShow;
  f: OSIstFilter;
begin
  f := OSIstFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := '(kod_ist < ''60'')';

  frmOSIstShow := TfrmOSIstShow.Create(Application, fmNormal, f);
  try
    frmOSIstShow.DisableActions([frmOSIstShow.actFilter, frmOSIstShow.actNoFilter]);
    with frmOSIstShow do
      if ShowModal = mrOk then
      begin
        edtOSIstCode.Text := GetReturnValue(sgOSIst, 1);
        edtOSIst.Text := GetReturnValue(sgOSIst, 2);
      end;
  finally
    frmOSIstShow.Free;
  end;
end;

procedure TfrmENBuildingEdit.spbOSKlassClearClick(Sender: TObject);
begin
  ClearControls([edtOSKlassCode, edtOSKlass]);
end;

procedure TfrmENBuildingEdit.spbOSKlassClick(Sender: TObject);
var
  frmOSKlassShow: TfrmOSKlassShow;
begin
  frmOSKlassShow := TfrmOSKlassShow.Create(Application, fmNormal);
  try
    with frmOSKlassShow do
      if ShowModal = mrOk then
      begin
        edtOSKlassCode.Text := GetReturnValue(sgOSKlass, 1);
        edtOSKlass.Text := GetReturnValue(sgOSKlass, 2);
      end;
  finally
    frmOSKlassShow.Free;
  end;
end;

procedure TfrmENBuildingEdit.spbOSPrivatClearClick(Sender: TObject);
begin
 ClearControls([edtOSPrivatCode, edtOSPrivat]);

end;

procedure TfrmENBuildingEdit.spbOSPrivatClick(Sender: TObject);
var
  frmOSPrivatShow: TfrmOSPrivatShow;
  f: OSPrivatFilter;
begin
  if (edtOSVidCode.Text = '') then
  begin
    Application.MessageBox(PChar('Спочатку оберіть вид ОЗ!'), PChar('Увага!'), MB_ICONWARNING);
    edtOSVidCode.SetFocus;
    Exit;
  end;

  f := OSPrivatFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := 'substr(kod_privat, 1, 2) = ''' + edtOSVidCode.Text + '''';

  frmOSPrivatShow := TfrmOSPrivatShow.Create(Application, fmNormal, f);
  try
    frmOSPrivatShow.DisableActions([frmOSPrivatShow.actFilter, frmOSPrivatShow.actNoFilter]);
    with frmOSPrivatShow do
      if ShowModal = mrOk then
      begin
        edtOSPrivatCode.Text := GetReturnValue(sgOSPrivat, 1);
        edtOSPrivat.Text := GetReturnValue(sgOSPrivat, 2);
      end;
  finally
    frmOSPrivatShow.Free;
  end;
end;

procedure TfrmENBuildingEdit.spbOSSelectClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f, tmpF : ENElementFilter;
   invNum , depName: String;
   depCode, elCode : Integer;
//   depShort : ENDepartmentShort;
  
   elList: ENElementShortList;
   elObj: ENElementShort;
   isMetrologyObject, isSizObject, isSzBrigade, isOperativeObj, isBuilderObject : Boolean;
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';

   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);

   try
      DisableActions([frmENElementShow.actInsert, frmENElementShow.actEdit , frmENElementShow.actDelete]);
      

      with frmENElementShow do
        if ShowModal = mrOk then
        begin

            try


               invNum := GetReturnValue(sgENElement,3) ;

               if ENBuildingObj.elementRef = nil then ENBuildingObj.elementRef := ENElementRef.Create();
               ENBuildingObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtNameOZ.Text := GetReturnValue(sgENElement,1);
               edtInvNumberOZ.Text := GetReturnValue(sgENElement,3);



            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENBuildingEdit.spbOSSubschClearClick(Sender: TObject);
begin
  ClearControls([edtOSSubschCode, edtOSSubsch, edtOSKod_zatr]);
end;

procedure TfrmENBuildingEdit.spbOSSubschClick(Sender: TObject);
var
  frmOSSubschShow: TfrmOSSubschShow;
  f: OSSubschFilter;
  str: String;
begin
  f := OSSubschFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.conditionSQL := '(kod_subsch like (''15%'') or kod_subsch like (''10%'') or kod_subsch like (''12%''))';

  frmOSSubschShow := TfrmOSSubschShow.Create(Application, fmNormal, f);
  try
    frmOSSubschShow.DisableActions([frmOSSubschShow.actFilter, frmOSSubschShow.actNoFilter]);
    with frmOSSubschShow do
      if ShowModal = mrOk then
      begin
        edtOSSubschCode.Text := GetReturnValue(sgOSSubsch, 1);
        edtOSSubsch.Text := GetReturnValue(sgOSSubsch, 2);

        str := Copy(edtOSSubschCode.Text, 1, 2);
        if str = '15' then
        begin
          if edtOSKod_zatr.Text = '' then
            edtOSKod_zatr.Text := '000000000000000';
        end
        else
          // сбросим после выбора счета, пусть вводят новый
          edtOSKod_zatr.Text := '';

      end;
  finally
    frmOSSubschShow.Free;
  end;
end;

procedure TfrmENBuildingEdit.spbOSVidClearClick(Sender: TObject);
begin
  ClearControls([edtOSVidCode, edtOSVid]);
  spbOSPrivatClearClick(Sender);
end;

procedure TfrmENBuildingEdit.spbOSVidClick(Sender: TObject);
var
  frmOSVidShow: TfrmOSVidShow;
begin
  frmOSVidShow := TfrmOSVidShow.Create(Application, fmNormal);
  try
    with frmOSVidShow do
      if ShowModal = mrOk then
      begin
        edtOSVidCode.Text := GetReturnValue(sgOSVid, 1);
        edtOSVid.Text := GetReturnValue(sgOSVid, 2);
        spbOSPrivatClearClick(Sender);
      end;
  finally
    frmOSVidShow.Free;
  end;
end;

procedure TfrmENBuildingEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1;

     if ENBuildingObj.departmentRef <> nil then
     begin
        if ENBuildingObj.departmentRef.code <> LOW_INT then
       begin
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) in (' +  DMReports.getFinRenByDepartmentCode( ENBuildingObj.departmentRef.code ) + ')';
       end;
     end;


   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert , actDelete ]);
        if ShowModal = mrOk then
        begin
            try

               edtCodeMol.Text := GetReturnValue(sgFINMol,0);// + ' ' + GetReturnValue(sgFINMol,1);
               //molCode := GetReturnValue(sgFINMol,0);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmENBuildingEdit.tbContractAddClick(Sender: TObject);
var
	frmShowENServicesConnection : TfrmENServicesConnectionShow;
	servicesFilter : ENServicesObjectFilter;
	servicesObjectCode : Integer;
  ENBuilding2ServicesObjectObj: ENBuilding2ServicesObject;
  TempENBuilding2ServicesObject: ENBuilding2ServicesObjectControllerSoapPort;
  TempENServicesCalculation: ENServicesObjectControllerSoapPort;
  ENServicesObjectObj: ENServicesObject;
begin

	servicesFilter := ENServicesObjectFilter.Create;
	SetNullXSProps(servicesFilter);
	SetNullIntProps(servicesFilter);
	servicesFilter.contractKindRef := ENServicesContractKindRef.Create;
	servicesFilter.contractKindRef.code := ENConsts.SERVICES_CONTRACT_KIND_SERVICES;
  servicesFilter.contractTypeRef := ENServicesContractTypeRef.Create;
  servicesFilter.contractTypeRef.code :=  ENConsts.ENSERVICESOBJECTTYPE_CONNECTION;

	frmShowENServicesConnection := TfrmENServicesConnectionShow.Create(Application,fmNormal, servicesFilter);

  DisableActions([frmShowENServicesConnection.actNoFilter,frmShowENServicesConnection.actEdit]);
  try
		with frmShowENServicesConnection do
			if ShowModal = mrOk then begin

				try
					servicesObjectCode := StrToInt(GetReturnValue(sgENServicesObject,0));
        except on EConvertError do Exit;
				end;

        TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
        try
          ENServicesObjectObj := TempENServicesCalculation.getObject(servicesObjectCode);
        except
          on EConvertError do Exit;
        end;

        //ENBuildingObj.servicesobject := ENServicesObjectRef.Create;
        //ENBuildingObj.servicesobject.code := servicesObjectCode;
        //edtServicesName.Text := GetReturnValue(sgENServicesObject,1) + ' | ' + GetReturnValue(sgENServicesObject,5);
        ENBuilding2ServicesObjectObj:=ENBuilding2ServicesObject.Create;
        SetNullIntProps(ENBuilding2ServicesObjectObj);
        SetNullXSProps(ENBuilding2ServicesObjectObj);

        ENBuilding2ServicesObjectObj.ENBuildingRef := ENBuildingRef.Create;
        ENBuilding2ServicesObjectObj.ENBuildingRef.code := ENBuildingObj.code;

        ENBuilding2ServicesObjectObj.servicesObjectRef := ENServicesObjectRef.Create;
        ENBuilding2ServicesObjectObj.servicesObjectRef.code := servicesObjectCode;

        TempENBuilding2ServicesObject := HTTPRIOENBuilding2ServicesObject as ENBuilding2ServicesObjectControllerSoapPort;

        ENBuilding2ServicesObjectObj.contractNumber  := GetReturnValue(sgENServicesObject,1);
        ENBuilding2ServicesObjectObj.contractDate := TXSDate.Create;
        ENBuilding2ServicesObjectObj.contractDate := ENServicesObjectObj.contractDate;
        //ENBuilding2ServicesObjectObj.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgENServicesObject, 2)) ));


        ENBuilding2ServicesObjectObj.partnerName := ENServicesObjectObj.name;
        ENBuilding2ServicesObjectObj.partnerCode := ENServicesObjectObj.partnerCode;

        ENBuilding2ServicesObjectObj.code := Low(Integer);
        TempENBuilding2ServicesObject.add(ENBuilding2ServicesObjectObj);

			end;
	finally
        UpdateGridsgENBuilding2ServicesObject(Sender);
        //frmShowENServicesConnection.Free;

     end;
end;

procedure TfrmENBuildingEdit.tbContractDeleteClick(Sender: TObject);
Var TempENBuilding2ServicesObject: ENBuilding2ServicesObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilding2ServicesObject := HTTPRIOENBuilding2ServicesObject as ENBuilding2ServicesObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilding2ServicesObject.Cells[0,sgENBuilding2ServicesObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Зв’язок нового будівництва ОЗ-1 до договору на приєднання)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilding2ServicesObject.remove(ObjCode);
      UpdateGridsgENBuilding2ServicesObject(Sender);
  end;
end;

procedure TfrmENBuildingEdit.actDeletecommissionExecute(Sender: TObject);
Var TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilding2Commission.Cells[0,sgENBuilding2Commission.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (члени комісії для нове будівництво)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilding2Commission.remove(ObjCode);
      UpdateGridsgENBuilding2Commission(Sender);
  end;
end;

procedure TfrmENBuildingEdit.actDeleteExecute(Sender: TObject);
Var TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilding2ENact.Cells[0,sgENBuilding2ENact.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (связка Капітальне будівництво к актам выполненых работ)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilding2ENact.remove(ObjCode);
      actUpdateGridActExecute(sender);
  end;
end;

procedure TfrmENBuildingEdit.actEditcommissionExecute(Sender: TObject);
var
  TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
begin
  TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;
  try
    ENBuilding2CommissionObj := TempENBuilding2Commission.getObject(StrToInt(sgENBuilding2Commission.Cells[0,sgENBuilding2Commission.Row]));
  except
    on EConvertError do Exit;
  end;


  frmENBuilding2CommissionEdit:=TfrmENBuilding2CommissionEdit.Create(Application, dsEdit);

  try
    if frmENBuilding2CommissionEdit.ShowModal= mrOk then
      begin
        //TempENBuilding2Commission.save(ENBuilding2CommissionObj);
        UpdateGridsgENBuilding2Commission(Sender);
      end;
  finally
    frmENBuilding2CommissionEdit.Free;
    frmENBuilding2CommissionEdit:=nil;
  end;

    sgENBuilding2Commission.Row := sgENBuilding2Commission.RowCount - 1;

end;

procedure TfrmENBuildingEdit.actEditExecute(Sender: TObject);
var
  TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
  selectedRow : integer;
begin
  TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;
  try
    ENBuilding2ENactObj := TempENBuilding2ENact.getObject(StrToInt(sgENBuilding2ENact.Cells[0,sgENBuilding2ENact.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENBuilding2ENact.Row;
  frmENBuilding2ENactEdit:=TfrmENBuilding2ENactEdit.Create(Application, dsEdit);

  try
    if frmENBuilding2ENactEdit.ShowModal= mrOk then
      begin

              actUpdateGridActExecute(sender);
      end;
  finally
    frmENBuilding2ENactEdit.Free;
    frmENBuilding2ENactEdit:=nil;
  end;

  if sgENBuilding2ENact.RowCount > selectedRow then
    sgENBuilding2ENact.Row := selectedRow
  else
    sgENBuilding2ENact.Row := sgENBuilding2ENact.RowCount - 1;

end;

procedure TfrmENBuildingEdit.actInsertcommissionExecute(Sender: TObject);
// Var TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
begin
  // TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBuilding2CommissionObj:=ENBuilding2Commission.Create;
  SetNullIntProps(ENBuilding2CommissionObj);
  SetNullXSProps(ENBuilding2CommissionObj);



  try
    frmENBuilding2CommissionEdit:=TfrmENBuilding2CommissionEdit.Create(Application, dsInsert);

    ENBuilding2CommissionObj.ENBuildingRef := ENBuildingRef.Create;
    ENBuilding2CommissionObj.ENBuildingRef.code:= ENBuildingObj.code;
    try
      if frmENBuilding2CommissionEdit.ShowModal = mrOk then
      begin
        if ENBuilding2CommissionObj<>nil then
            //TempENBuilding2Commission.add(ENBuilding2CommissionObj);
            UpdateGridsgENBuilding2Commission(Sender);
      end;
    finally
      frmENBuilding2CommissionEdit.Free;
      frmENBuilding2CommissionEdit:=nil;
    end;
  finally
    ENBuilding2CommissionObj.Free;
  end;
end;

procedure TfrmENBuildingEdit.actInsertExecute(Sender: TObject);
var
f : ENActFilter;
frmENActShow : TfrmENActShow;
b2a  : ENBuilding2ENact;
TempENBuilding2ENact : ENBuilding2ENactControllerSoapPort;
begin

  if (ENBuildingObj.statusRef.code <> ENBUILDING_STATUS_DRAFT) then
  begin
      Application.MessageBox(PChar(' Додавати акти можливо тільки якщо Документ ОЗ-1 знаходиться в черновому статусі!!! '),
                    PChar('Увага !'),MB_ICONWARNING );
      Exit;
  end;

  if PageControl1.ActivePage = tsBuilding2Act then
   Begin

        f := ENActFilter.Create;
        SetNullIntProps(f);
        SetNullXSProps(f);

        // выберем акты по объектам  energyNET которые имеют инвентарный который забит в документе ОЗ
        //  и которые не привязаные к связке ОЗ1и акты (ENBuilding2Enact)
        f.conditionSQL := ' enact.code in ( Select a.code from enact a  , enelementdata eld   ' +
                              ' where a.elementcode = eld.ecode ' +
                              ' and a.statusrefcode in (' + IntToStr( ENACT_CLOSED) + ',' + IntToStr(ENACT_SIGNATURE) + ')' +
                              ' and a.code not in (select distinct b2a.actrefcode from enbuilding2enact b2a )   )';
         frmENActShow:=TfrmENActShow.Create(Application,fmNormal, f);
         try


           // frmENActShow.isFiltered := true;


            with frmENActShow do begin
              DisableActions([ actEdit, actDelete , actInsert ]);
              if ShowModal = mrOk then
              begin


                          TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;

                          b2a:=ENBuilding2ENact.Create;
                          b2a.actRef := ENActRef.Create;
                          b2a.ENBuildingRef :=  ENBuildingRef.Create;

                          b2a.code := LOW_INT;
                          b2a.ENBuildingRef.code := ENBuildingObj.code;
                          b2a.actRef.code := StrToInt(GetReturnValue(sgENAct,0));

                          TempENBuilding2ENact.add(b2a);
                          actUpdateGridActExecute(sender);





                    end;
                  end;
         finally
            frmENActShow.Free;
         end;

   end;
   // если вкладка акты проектные без EnergyNET откроем форму добавления
//   if pgc1.ActivePage = tsActProject then
//   Begin
//        ENActProj2OZ2Obj:=ENActProj2OZ2.Create;
//        ENActProj2OZ2Obj.ENReconstrModernOZRef := ENReconstrModernOZRef.Create;
//        ENActProj2OZ2Obj.ENReconstrModernOZRef.code := ENReconstrModernOZObj.code;
//
//
//        try
//          frmENActProj2OZ2Edit:=TfrmENActProj2OZ2Edit.Create(Application, dsInsert);
//          try
//            if frmENActProj2OZ2Edit.ShowModal = mrOk then
//            begin
//              if ENActProj2OZ2Obj<>nil then
//                  actUpdateGridActProjectExecute(Sender);
//            end;
//          finally
//            frmENActProj2OZ2Edit.Free;
//            frmENActProj2OZ2Edit:=nil;
//          end;
//        finally
//          ENActProj2OZ2Obj.Free;
//        end;
//   end;


    edtSummaGen.Text := FloatToStr(getSummaGenByOZ1(ENBuildingObj.code));
    //edtContractPrice.Text :=  FloatToStr(getcontractpriceByOZ1(ENBuildingObj.code));

//    ENReconstrModernOZObj.partnerCode := getPartnerCodeByOZ(ENReconstrModernOZObj.code);
//    ENReconstrModernOZObj.partnerName := getPartnerNameByOZ(ENReconstrModernOZObj.code);
//    ENReconstrModernOZObj.finContractNumber := getfinContractNumberByOZ(ENReconstrModernOZObj.code);

//    if getfinContractDateByOZ(ENReconstrModernOZObj.code) <> 0  then
//     begin
//       if ENReconstrModernOZObj.finContractDate = nil then
//          ENReconstrModernOZObj.finContractDate := TXSDate.Create;
//       ENReconstrModernOZObj.finContractDate.XSToNative(GetXSDate(getfinContractDateByOZ(ENReconstrModernOZObj.code)));
//     end
//     else
//       ENReconstrModernOZObj.finContractDate := nil;


end;


// договорная стоимость по оз
function  TfrmENBuildingEdit.getcontractpriceByOZ1(codeOz : integer):Double;
var
  TempENBuilding: ENBuildingControllerSoapPort;
  OZ1Obj : ENBuilding;
begin

  TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;
  OZ1Obj :=  TempENBuilding.getObject(codeOz);
   if ( OZ1Obj.contractPrice <> nil ) then
   if ( OZ1Obj.contractPrice.decimalString <> '0' ) then
     result := StrToFloat( OZ1Obj.contractPrice.decimalString)
   else
     Result := 0;

  //edtContractPrice.Text := FloatToStr(Result);

end;

function  TfrmENBuildingEdit.getSummaGenByOZ1(codeOz : integer):Double;
var
  TempENBuilding : ENBuildingControllerSoapPort;
  OZ1Obj : ENBuilding;
begin

  TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;
  OZ1Obj :=  TempENBuilding.getObject(codeOz);

  if ( OZ1Obj.summaGen <> nil ) then
   if ( OZ1Obj.summaGen.decimalString <> '0' ) then
  result := StrToFloat( OZ1Obj.summaGen.decimalString)
  else
  result := 0;


  edtSummaGen.Text := FloatToStr(result);
  //Panel1.Caption :=  FloatToStr(result);
  //Panel2.Caption := FloatToStr(result);


end;

procedure TfrmENBuildingEdit.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage = tsBuilding2Act then
  begin
     actUpdateENbuilding2ActExecute(sender);
  end;

  if ((ENBuildingObj <> nil) and (PageControl1.ActivePage = tsMain )) then
  begin
    edtSummaGen.Text := FloatToStr(getSummaGenByOZ1(ENBuildingObj.code ));
    //edtContractPrice.Text :=  FloatToStr(getcontractpriceByOZ1(ENBuildingObj.code));
  end;

  if PageControl1.ActivePage = tsBuhData then
  begin
    updateOSDataTab();
    LockUnlockOSData();
  end;

  if PageControl1.ActivePage = tsPrintinfo then
  begin
    UpdateGridsgENBuilding2Commission(Sender);
  end;



end;

procedure TfrmENBuildingEdit.actUpdatecommissionExecute(Sender: TObject);
begin
  //inherited;
   UpdateGridsgENBuilding2Commission(Sender);
end;

procedure TfrmENBuildingEdit.UpdateGridsgENBuilding2Commission(Sender: TObject);
var
  i, j , LastCount , LastRow: Integer;
  TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
  TempENBuilding2CommissionFilter : ENBuilding2CommissionFilter;
  ENBuilding2CommissionList: ENBuilding2CommissionShortList;
begin
 for i:=1 to sgENBuilding2Commission.RowCount-1 do
   for j:=0 to sgENBuilding2Commission.ColCount-1 do
     sgENBuilding2Commission.Cells[j,i]:='';

  SetGridHeaders(ENBuilding2CommissionHeaders, sgENBuilding2Commission.ColumnHeaders);

  TempENBuilding2Commission :=  HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;

     TempENBuilding2CommissionFilter := ENBuilding2CommissionFilter.Create;
     SetNullIntProps(TempENBuilding2CommissionFilter);
     SetNullXSProps(TempENBuilding2CommissionFilter);

     TempENBuilding2CommissionFilter.ENBuildingRef := ENBuildingRef.Create;
     TempENBuilding2CommissionFilter.ENBuildingRef.code := ENBuildingObj.code;


  ENBuilding2CommissionList := TempENBuilding2Commission.getScrollableFilteredList(TempENBuilding2CommissionFilter,0,1000);
  LastCount:=High(ENBuilding2CommissionList.list);

  if LastCount > -1 then
     sgENBuilding2Commission.RowCount:=LastCount+2
  else
     sgENBuilding2Commission.RowCount:=2;

   with sgENBuilding2Commission do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2CommissionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilding2CommissionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuilding2CommissionList.list[i].tabNumber;
        Cells[2,i+1] := ENBuilding2CommissionList.list[i].FIO;
        Cells[3,i+1] := ENBuilding2CommissionList.list[i].shortFIO;
        Cells[4,i+1] := ENBuilding2CommissionList.list[i].positionName;
        Cells[5,i+1] := ENBuilding2CommissionList.list[i].ENBuildingCommissionTypeRefName;
        LastRow:=i+1;
        sgENBuilding2Commission.RowCount:=LastRow+1;
      end;


    sgENBuilding2Commission.Row:=1;


end;

procedure TfrmENBuildingEdit.actUpdateENbuilding2ActExecute(Sender: TObject);
var
  TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
  i , j , ColCount , LastCount  , LastRow : Integer;
  ENBuilding2ENactList: ENBuilding2ENactShortList;
  b2aFil: ENBuilding2ENactFilter;

begin
  SetGridHeaders(ENBuilding2ENactHeaders, sgENBuilding2ENact.ColumnHeaders);

   for i:=1 to sgENBuilding2ENact.RowCount-1 do
   for j:=0 to sgENBuilding2ENact.ColCount-1 do
     sgENBuilding2ENact.Cells[j,i]:='';


  TempENBuilding2ENact :=  HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;


     b2aFil := ENBuilding2ENactFilter.Create;
     SetNullIntProps(b2aFil);
     SetNullXSProps(b2aFil);
     b2aFil.ENBuildingRef := ENBuildingRef.Create;
     b2aFil.ENBuildingRef.code := ENBuildingObj.code;

  ENBuilding2ENactList := TempENBuilding2ENact.getScrollableFilteredList(b2aFil,0,100000);
  LastCount:=High(ENBuilding2ENactList.list);

  if LastCount > -1 then
     sgENBuilding2ENact.RowCount:=LastCount+2
  else
     sgENBuilding2ENact.RowCount:=2;

   with sgENBuilding2ENact do
    for i:=0 to LastCount do
      begin
         Application.ProcessMessages;
        if ENBuilding2ENactList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilding2ENactList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENBuilding2ENactList.list[i].sumGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENBuilding2ENactList.list[i].sumGen.DecimalString;
        if ENBuilding2ENactList.list[i].sumNds = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENBuilding2ENactList.list[i].sumNds.DecimalString;
        if ENBuilding2ENactList.list[i].isCalculationDate = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENBuilding2ENactList.list[i].isCalculationDate);
        Cells[4,i+1] := ENBuilding2ENactList.list[i].finContractNumber;
        if ENBuilding2ENactList.list[i].finContractDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENBuilding2ENactList.list[i].finContractDate);
        Cells[6,i+1] := ENBuilding2ENactList.list[i].partnerName;
        Cells[7,i+1] := ENBuilding2ENactList.list[i].partnerCode;
        if ENBuilding2ENactList.list[i].isActFromEnergyNET = nil then
          Cells[8,i+1] := ''
        else
          if ENBuilding2ENactList.list[i].isActFromEnergyNET.AsBoolean = true then Cells[8,i+1] := 'Так' else Cells[8,i+1] := 'Ні';
        Cells[9,i+1] := ENBuilding2ENactList.list[i].actNumber;
        if ENBuilding2ENactList.list[i].actDate = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDateTimeWithDate2String(ENBuilding2ENactList.list[i].actDate);
        LastRow:=i+1;
        sgENBuilding2ENact.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENBuilding2ENact.Row:=1;



end;

procedure TfrmENBuildingEdit.actUpdateGridActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  actDate: String;
  LastRow , LastCount  , i : integer;

   TempB2ENact : ENBuilding2ENactControllerSoapPort;
   B2ActFilter : ENBuilding2ENactFilter;
   ENBuilding2ENactList : ENBuilding2ENactShortList;

begin
    ClearGrid(sgENBuilding2ENact);

    TempB2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;

    B2ActFilter := ENBuilding2ENactFilter.Create;
    SetNullIntProps(B2ActFilter);
    SetNullXSProps(B2ActFilter);

    B2ActFilter.ENBuildingRef := ENBuildingRef.Create;
    B2ActFilter.ENBuildingRef.code := ENBuildingObj.code;

    ENBuilding2ENactList := TempB2ENact.getScrollableFilteredList(B2ActFilter, 0, -1);

      LastCount := High(ENBuilding2ENactList.list);


    if LastCount > -1 then
      sgENBuilding2ENact.RowCount := LastCount + 2
    else
      sgENBuilding2ENact.RowCount := 2;


   with sgENBuilding2ENact do
    for i:=0 to LastCount do
      begin
         Application.ProcessMessages;
        if ENBuilding2ENactList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilding2ENactList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENBuilding2ENactList.list[i].sumGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENBuilding2ENactList.list[i].sumGen.DecimalString;
        if ENBuilding2ENactList.list[i].sumNds = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENBuilding2ENactList.list[i].sumNds.DecimalString;
        if ENBuilding2ENactList.list[i].isCalculationDate = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENBuilding2ENactList.list[i].isCalculationDate);
        Cells[4,i+1] := ENBuilding2ENactList.list[i].finContractNumber;
        if ENBuilding2ENactList.list[i].finContractDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENBuilding2ENactList.list[i].finContractDate);
        Cells[6,i+1] := ENBuilding2ENactList.list[i].partnerName;
        Cells[7,i+1] := ENBuilding2ENactList.list[i].partnerCode;
        if ENBuilding2ENactList.list[i].isActFromEnergyNET = nil then
          Cells[8,i+1] := ''
        else
          if ENBuilding2ENactList.list[i].isActFromEnergyNET.AsBoolean = true then Cells[8,i+1] := 'Так' else Cells[8,i+1] := 'Ні';
        Cells[9,i+1] := ENBuilding2ENactList.list[i].actNumber;
        if ENBuilding2ENactList.list[i].actDate = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDateTimeWithDate2String(ENBuilding2ENactList.list[i].actDate);
        LastRow:=i+1;
        sgENBuilding2ENact.RowCount:=LastRow+1;
      end;


    sgENBuilding2ENact.Row:=1;

    sgENBuilding2ENact.Row := 1;


end;

procedure TfrmENBuildingEdit.actViewcommissionExecute(Sender: TObject);
var
  TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
begin
  TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;
  try
    ENBuilding2CommissionObj := TempENBuilding2Commission.getObject(StrToInt(sgENBuilding2Commission.Cells[0,sgENBuilding2Commission.Row]));
  except
    on EConvertError do Exit;
  end;


  frmENBuilding2CommissionEdit:=TfrmENBuilding2CommissionEdit.Create(Application, dsView);

  try
    frmENBuilding2CommissionEdit.ShowModal;
  finally
    frmENBuilding2CommissionEdit.Free;
    frmENBuilding2CommissionEdit:=nil;
  end;


    sgENBuilding2Commission.Row := sgENBuilding2Commission.RowCount - 1;

end;

procedure TfrmENBuildingEdit.actViewExecute(Sender: TObject);
var
  TempENBuilding2ENact: ENBuilding2ENactControllerSoapPort;
  selectedRow : Integer;
begin
  TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;
  try
    ENBuilding2ENactObj := TempENBuilding2ENact.getObject(StrToInt(sgENBuilding2ENact.Cells[0,sgENBuilding2ENact.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENBuilding2ENact.Row;
  frmENBuilding2ENactEdit:=TfrmENBuilding2ENactEdit.Create(Application, dsView);

  try
    frmENBuilding2ENactEdit.ShowModal;
  finally
    frmENBuilding2ENactEdit.Free;
    frmENBuilding2ENactEdit:=nil;
  end;

  if sgENBuilding2ENact.RowCount > selectedRow then
    sgENBuilding2ENact.Row := selectedRow
  else
    sgENBuilding2ENact.Row := sgENBuilding2ENact.RowCount - 1;

end;

procedure TfrmENBuildingEdit.addActFromEnergynetClick(Sender: TObject);
var
f : ENActFilter;
frmENActShow : TfrmENActShow;
b2a  : ENBuilding2ENact;
TempENBuilding2ENact : ENBuilding2ENactControllerSoapPort;
TempENBuilding2ServicesObject: ENBuilding2ServicesObjectControllerSoapPort;
build2SOFil:ENBuilding2ServicesObjectFilter;
build2SOLastCount :Integer;
ENBuilding2ServicesObjectList: ENBuilding2ServicesObjectShortList;
EnServicesObjectStrCode:String;
i:Integer;
begin

  if (ENBuildingObj.statusRef.code <> ENBUILDING_STATUS_DRAFT) then
  begin
      Application.MessageBox(PChar(' Додавати акти можливо тільки якщо Документ ОЗ-1 знаходиться в черновому статусі!!! '),
                    PChar('Увага !'),MB_ICONWARNING );
      Exit;
  end;

  if PageControl1.ActivePage = tsBuilding2Act then
   Begin
      TempENBuilding2ServicesObject :=  HTTPRIOENBuilding2ServicesObject as ENBuilding2ServicesObjectControllerSoapPort;

      build2SOFil := ENBuilding2ServicesObjectFilter.Create;
      SetNullIntProps(build2SOFil);
      SetNullXSProps(build2SOFil);

      build2SOFil.ENBuildingRef:= ENBuildingRef.Create;
      build2SOFil.ENBuildingRef.code := ENBuildingObj.code;

      ENBuilding2ServicesObjectList := TempENBuilding2ServicesObject.getScrollableFilteredList(build2SOFil,0,-1);
      build2SOLastCount:=High(ENBuilding2ServicesObjectList.list);

      for i:=0 to build2SOLastCount do
      begin
         if Length(EnServicesObjectStrCode) = 0  then
             EnServicesObjectStrCode:= IntToStr(ENBuilding2ServicesObjectList.list[i].servicesObjectRefCode)
         else
             EnServicesObjectStrCode:= EnServicesObjectStrCode + ','+IntToStr(ENBuilding2ServicesObjectList.list[i].servicesObjectRefCode)
      end;

      if Length(EnServicesObjectStrCode) <> 0 then
      begin
          frmENActAdd := TfrmENActAdd.Create(Application, dsInsert);
          frmENActAdd.ENBuildingObjCode:= ENBuildingObj.code;
          frmENActAdd.isoz1:= true;
            try

               frmENActAdd.EnServicesObjectStrCode := EnServicesObjectStrCode;

               if frmENActAdd.ShowModal = mrOK then
               begin

                end;
            finally
               frmENActAdd.Free;
               frmENActAdd := nil;
            end;

           // actUpdateGridActExecute(sender);

        end
        else
        begin
                f := ENActFilter.Create;
                SetNullIntProps(f);
                SetNullXSProps(f);

                // выберем акты по объектам  energyNET которые имеют инвентарный который забит в документе ОЗ
                //  и которые не привязаные к связке ОЗ1и акты (ENBuilding2Enact)
                f.conditionSQL := ' enact.code in ( Select a.code from enact a  , enelementdata eld   ' +
                                      ' where a.elementcode = eld.ecode ' +
                                      ' and a.statusrefcode in (' + IntToStr( ENACT_CLOSED) + ',' + IntToStr(ENACT_SIGNATURE) + ')' +
                                      ' and a.code not in (select distinct b2a.actrefcode from enbuilding2enact b2a )   )';
                 frmENActShow:=TfrmENActShow.Create(Application,fmNormal, f);
                 frmENActShow.isoz1:= true;

                 try

                    with frmENActShow do begin
                      DisableActions([ actEdit, actDelete , actInsert ]);
                      if ShowModal = mrOk then
                      begin


                                TempENBuilding2ENact := HTTPRIOENBuilding2ENact as ENBuilding2ENactControllerSoapPort;

                                b2a:=ENBuilding2ENact.Create;
                                b2a.actRef := ENActRef.Create;
                                b2a.ENBuildingRef :=  ENBuildingRef.Create;

                                b2a.code := LOW_INT;
                                b2a.ENBuildingRef.code := ENBuildingObj.code;
                                b2a.actRef.code := StrToInt(GetReturnValue(sgENAct,0));

                                b2a.isActFromEnergyNET := TXSBoolean.Create;
                                b2a.isActFromEnergyNET.asBoolean :=  true;


                                TempENBuilding2ENact.add(b2a);


                            end;
                          end;
                 finally
                    frmENActShow.Free;
                 end;
        end;

              actUpdateENbuilding2ActExecute(sender);
   end;



    edtSummaGen.Text := FloatToStr(getSummaGenByOZ1(ENBuildingObj.code));
    //edtContractPrice.Text :=  FloatToStr(getcontractpriceByOZ1(ENBuildingObj.code));



end;

procedure TfrmENBuildingEdit.addActNotFromEnergynetClick(Sender: TObject);
var
f : ENActFilter;
frmENActShow : TfrmENActShow;
b2a  : ENBuilding2ENact;
TempENBuilding2ENact : ENBuilding2ENactControllerSoapPort;
begin

  if (ENBuildingObj.statusRef.code <> ENBUILDING_STATUS_DRAFT) then
  begin
      Application.MessageBox(PChar(' Додавати акти можливо тільки якщо Документ ОЗ-1 знаходиться в черновому статусі!!! '),
                    PChar('Увага !'),MB_ICONWARNING );
      Exit;
  end;


        ENBuilding2ENactObj:=ENBuilding2ENact.Create;
        ENBuilding2ENactObj.ENBuildingRef := ENBuildingRef.Create;
        ENBuilding2ENactObj.ENBuildingRef.code := ENBuildingObj.code;
        ENBuilding2ENactObj.isActFromEnergyNET := TXSBoolean.Create;
        ENBuilding2ENactObj.isActFromEnergyNET.asBoolean :=  false;


        try
          frmENBuilding2ENactEdit:=TfrmENBuilding2ENactEdit.Create(Application, dsInsert);
          try
            if frmENBuilding2ENactEdit.ShowModal = mrOk then
            begin
              if ENBuildingObj <>nil then
                  actUpdateGridActExecute(sender);
            end;
          finally
            frmENBuilding2ENactEdit.Free;
            frmENBuilding2ENactEdit:=nil;
          end;
        finally
          ENBuildingObj.Free;
        end;



    

//    ENReconstrModernOZObj.partnerCode := getPartnerCodeByOZ(ENReconstrModernOZObj.code);
//    ENReconstrModernOZObj.partnerName := getPartnerNameByOZ(ENReconstrModernOZObj.code);
//    ENReconstrModernOZObj.finContractNumber := getfinContractNumberByOZ(ENReconstrModernOZObj.code);

//    if getfinContractDateByOZ(ENReconstrModernOZObj.code) <> 0  then
//     begin
//       if ENReconstrModernOZObj.finContractDate = nil then
//          ENReconstrModernOZObj.finContractDate := TXSDate.Create;
//       ENReconstrModernOZObj.finContractDate.XSToNative(GetXSDate(getfinContractDateByOZ(ENReconstrModernOZObj.code)));
//     end
//     else
//       ENReconstrModernOZObj.finContractDate := nil;


end;

procedure TfrmENBuildingEdit.btnOSDataCancelClick(Sender: TObject);
begin
  updateOSDataTab();
  LockUnlockOSData();
end;

procedure TfrmENBuildingEdit.btnOSDataEditClick(Sender: TObject);
begin
 LockUnlockOSData(false);
end;

procedure TfrmENBuildingEdit.btnOSDataSaveClick(Sender: TObject);
var TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
    newOSDataCode: Integer;
    str: String;
begin
  if not NoBlankValues([edtOSIstCode, edtOSSubschCode, edtOSVidCode, edtOSPrivatCode,
                        edtOSGrCode, edtOSSum_st_perv_n, edtOSKod_nal_nakl,
                        edtOSKod_zatr]) then
  begin
    Application.MessageBox(PChar('Заповніть, будь ласка, обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING);
    AllowClose := false;
    Exit;
  end;

  ///// 29.11.12 Пожелания бухгалтерии
  // Если 10-й или 12-й счет - то "Код затрат №1" <> 15 нулей
  str := Copy(edtOSSubschCode.Text, 1, 2);
  if (str <> '15') and (edtOSKod_zatr.Text = '000000000000000') then
  begin
    Application.MessageBox(PChar('Неприпустиме значення в полі "Код витрат №1" для рахунку ' + edtOSSubschCode.Text + '!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtOSKod_zatr.SetFocus;
    AllowClose := false;
    Exit;
  end;
  /////

  TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;

  if OSData = nil then
  begin
    OSData := ENBuilding2OSData.Create;
    SetNullIntProps(OSData);
    SetNullXSProps(OSData);

    OSData.ENBuildingRef := ENBuildingRef.Create;
    OSData.ENBuildingRef.code := ENBuildingObj.code;
  end
  else begin
    if OSData.code > LOW_INT then
      OSData := TempENBuilding2OSData.getObject(OSData.code)
    else
      raise Exception.Create('Помилка під час вибору бух. даних для ОЗ!');
  end;

  OSData.kod_ist := edtOSIstCode.Text;
  OSData.name_ist := edtOSIst.Text;

  OSData.kod_subsch := edtOSSubschCode.Text;
  OSData.name_subsch := edtOSSubsch.Text;

  OSData.kod_vid := edtOSVidCode.Text;
  OSData.name_vid := edtOSVid.Text;

  OSData.kod_privat := edtOSPrivatCode.Text;
  OSData.name_privat := edtOSPrivat.Text;

  OSData.kod_gr := edtOSGrCode.Text;
  OSData.name_gr := edtOSGr.Text;

  if edtOSKlassCode.Text <> '' then
  begin
    try
      OSData.num_klass := StrToInt(edtOSKlassCode.Text);
      OSData.name_klass := edtOSKlass.Text;
    except
      on EConvertError do
        raise Exception.Create('Невірне значення у полі "Код КОФ"! Поле має бути числовим!');
    end;
  end
  else begin
    OSData.num_klass := LOW_INT;
    OSData.name_klass := '';
  end;

  if rdbOSF_amortY.Checked then
    OSData.f_amort := 'Y'
  else
    OSData.f_amort := 'N';

  if dtpOSDt_vypusk.Checked then
  begin
    if OSData.dt_vypusk = nil then
      OSData.dt_vypusk := TXSDate.Create;
    OSData.dt_vypusk.XSToNative(GetXSDate(dtpOSDt_vypusk.DateTime));
  end
  else
    OSData.dt_vypusk := nil;


   if dtpOSDt_posting.Checked then
  begin
    if OSData.datePosting = nil then
      OSData.datePosting := TXSDate.Create;
    OSData.datePosting.XSToNative(GetXSDate(dtpOSDt_posting.DateTime));
  end
  else
    OSData.datePosting := nil;


  if edtOSSum_izn_perv.Text <> '' then
  begin
    if OSData.sum_izn_perv = nil then
      OSData.sum_izn_perv := TXSDecimal.Create;
    OSData.sum_izn_perv.DecimalString := edtOSSum_izn_perv.Text;
  end
  else
    OSData.sum_izn_perv := nil;

  if edtOSSum_izn_perv_n.Text <> '' then
  begin
    if OSData.sum_izn_perv_n = nil then
      OSData.sum_izn_perv_n := TXSDecimal.Create;
    OSData.sum_izn_perv_n.DecimalString := edtOSSum_izn_perv_n.Text;
  end
  else
    OSData.sum_izn_perv_n := nil;

  if edtOSSum_st_perv_n.Text <> '' then
  begin
    if OSData.sum_st_perv_n = nil then
      OSData.sum_st_perv_n := TXSDecimal.Create;
    OSData.sum_st_perv_n.DecimalString := edtOSSum_st_perv_n.Text;
  end
  else
    OSData.sum_st_perv_n := nil;

  // Должно быть указано 15 символов. Незаполненное дополняется нулями
  while (Length(edtOSKod_zatr.Text) < 15) do
    edtOSKod_zatr.Text := edtOSKod_zatr.Text + '0';
  OSData.kod_zatr := edtOSKod_zatr.Text;

  OSData.kod_oborud := edtOSKod_oborud.Text;

  OSData.primechan := Trim(edtOSPrimechan.Text);
  OSData.characters := Trim(memOSCharacters.Text);

  OSData.kod_nal_nakl := edtOSKod_nal_nakl.Text;

  //////////////////////////////////////////////////////////
  str := Copy(edtOSSubschCode.Text, 1, 2);
  if str = '15' then
  begin
    OSData.id_amort := LOW_INT;
    OSData.kod_amort := '';
    OSData.name_amort := '';

    OSData.kod_am := LOW_INT;
    OSData.name_am := '';

    OSData.kod_am_n := LOW_INT;
    OSData.name_am_n := '';

    OSData.use_limit := LOW_INT;
    OSData.use_limit_n := LOW_INT;
  end;
  //////////////////////////////////////////////////////////

  // Добавляем (или сохраняем, если уже есть) связку
  if OSData.code = LOW_INT then
  begin
    newOSDataCode := TempENBuilding2OSData.add(OSData);
   
  end
  else begin
    TempENBuilding2OSData.save(OSData);

  end;

  Application.MessageBox(PChar('Дані збережено!'), PChar('Інформація'), MB_ICONINFORMATION);
  AllowClose := true;
  updateOSDataTab();
  LockUnlockOSData();
end;

procedure TfrmENBuildingEdit.btnPrintOrderClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;


  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  actDate: String;
  LastCount  , i : integer;

//   TempRMOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
//   RMOZ2ENactFilter : ENReconstrModernOZ2ENactFilter;
//   RMOZ2ENactList : ENReconstrModernOZ2ENactShortList;
	 isPrint  : Boolean;


//	 Tempenactproj2oz2date : enactproj2oz2dateControllerSoapPort;
//
//	 ap2oz2dateFilter : ENActProj2OZ2DateFilter;
//	 ap2oz2dateList : enactproj2oz2dateShortList;
begin
  isPrint := True;
//	TempRMOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
//	Tempenactproj2oz2date := HTTPRIOENActProj2OZ2Date as enactproj2oz2dateControllerSoapPort;
//
//    RMOZ2ENactFilter := ENReconstrModernOZ2ENactFilter.Create;
//    SetNullIntProps(RMOZ2ENactFilter);
//    SetNullXSProps(RMOZ2ENactFilter);
//
//    RMOZ2ENactFilter.ENReconstrModernOZRef:= ENReconstrModernOZRef.Create;
//		RMOZ2ENactFilter.ENReconstrModernOZRef.code := ENReconstrModernOZObj.code;
//		//
//		ap2oz2dateFilter := ENActProj2OZ2DateFilter.Create;
//		SetNullIntProps(ap2oz2dateFilter);
//		SetNullXSProps(ap2oz2dateFilter);
//
//		ap2oz2dateFilter.conditionSQL :=   ' enactproj2oz2date.code in  (Select enactproj2oz2date.code from enactproj2oz2date  , enactproj2oz2 '+
//																			 '	where enactproj2oz2date.enactprojrefcode = enactproj2oz2.code '+
//																			 '	and enactproj2oz2.enreconstrmodernozrfcd = '+ IntToStr(ENReconstrModernOZObj.code) + ')' ;
//
//
//		RMOZ2ENactList := TempRMOZ2ENact.getScrollableFilteredListForRM(RMOZ2ENactFilter, 0, -1);
//		ap2oz2dateList := Tempenactproj2oz2date.getScrollableFilteredList(ap2oz2dateFilter, 0, -1);
//
//		LastCount := High(RMOZ2ENactList.list);



       SetLength(argNames, 1);
       SetLength(args, 1);
       argnames[0] := 'ozCode';
       args[0] := IntToStr( ENBuildingObj.code );
       reportName := 'OS_T/OZ-1';
			 if( (isPrint)   ) then
       makeReport(reportName, argNames, args, 'xls')



end;

procedure TfrmENBuildingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding: ENBuildingControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumbergen  , edtNameOZ , edtExploitationTerm

     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBuilding := HTTPRIOENBuilding as ENBuildingControllerSoapPort;

     ENBuildingObj.numbergen := edtNumbergen.Text;
     ENBuildingObj.dateGen := GetTXSDateFromTDateTimePicker(edtDateGen);
     ENBuildingObj.summaGen := GetTXSDecimalFromTEdit(edtSummaGen);
     //ENBuildingObj.summaNDS := GetTXSDecimalFromTEdit(edtSummaNDS);
     ENBuildingObj.characteristic := edtCharacteristic.Text; 
     //ENBuildingObj.executedPosition := edtExecutedPosition.Text;
     //ENBuildingObj.executedName := edtExecutedName.Text;
     //ENBuildingObj.acceptedPosition := edtAcceptedPosition.Text;
     //ENBuildingObj.acceptedName := edtAcceptedName.Text;
     //ENBuildingObj.contractPrice := GetTXSDecimalFromTEdit(edtContractPrice);
     ENBuildingObj.codeMol := edtCodeMol.Text; 
     ENBuildingObj.codePodr := edtCodePodr.Text; 
     ENBuildingObj.invNumberOZ := edtInvNumberOZ.Text; 
     ENBuildingObj.nameOZ := edtNameOZ.Text;
//     ENBuildingObj.finContractNumber := edtFinContractNumber.Text;
//     ENBuildingObj.finContractDate := GetTXSDateFromTDateTimePicker(edtFinContractDate);
//     ENBuildingObj.partnerName := edtPartnerName.Text;
//     ENBuildingObj.partnerCode := edtPartnerCode.Text;
//     ENBuildingObj.characteristicOS := edtCharacteristicOS.Text;
 

       if ( chkisInvestProgram.Checked = true ) then
       ENBuildingObj.isInvestProgram := 1
     else
       ENBuildingObj.isInvestProgram := 0;

       ENBuildingObj.yearInvestProgram := edtYearInvestProgram.Text;

       ENBuildingObj.itemInvestProgram := edtItemInvestProgram.Text;


     ENBuildingObj.yearInvestProgram := edtYearInvestProgram.Text; 
     ENBuildingObj.itemInvestProgram := edtItemInvestProgram.Text;



    ENBuildingObj.buildingAddress := edtBuildingAddress.Text;
    ENBuildingObj.decreeNumber := edtDecreeNumber.Text;
    ENBuildingObj.decreeDate := GetTXSDateFromTDateTimePicker(edtDecreeDate);
     if ( edtExploitationTerm.Text <> '' ) then
       ENBuildingObj.exploitationTerm := StrToInt(edtExploitationTerm.Text)
     else
       ENBuildingObj.exploitationTerm := Low(Integer) ;
     ENBuildingObj.dateLoadExpl := GetTXSDateFromTDateTimePicker(edtDateLoadExpl);
     ENBuildingObj.dateBuild := GetTXSDateFromTDateTimePicker(edtDateBuild);



    if DialogState = dsInsert then
    begin
      ENBuildingObj.code:=low(Integer);
      TempENBuilding.add(ENBuildingObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuilding.save(ENBuildingObj);
    end;
  end;
end;

procedure TfrmENBuildingEdit.LockUnlockOSData(lock: Boolean);
begin
  // Если OZ не в статусе "Складений", ничего не разлочиваем !!!
  if not ( ( statusCode in [ENBUILDING_STATUS_SIGNED , ENBUILDING_STATUS_DRAFT]) or (HTTPRIOenbuilding.HTTPWebNode.UserName = 'energynet' ) ) then
  begin
    DisableControls([spbOSIst, spbOSIstClear,
                     spbOSSubsch, spbOSSubschClear,
                     spbOSVid, spbOSVidClear,
                     spbOSPrivat, spbOSPrivatClear,
                     spbOSGr, spbOSGrClear,
                     spbOSKlass, spbOSKlassClear,

                     rdbOSF_amortY, rdbOSF_amortN,
                     dtpOSDt_vypusk,dtpOSDt_posting,
                     edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n,
                     edtOSKod_nal_nakl,
                     edtOSKod_zatr, edtOSKod_oborud,
                     edtOSPrimechan, memOSCharacters]);

    DisableControls([btnOSDataEdit, btnOSDataSave, btnOSDataCancel]);

    Exit;
  end;

  DisableControls([spbOSIst, spbOSIstClear,
                   spbOSSubsch, spbOSSubschClear,
                   spbOSVid, spbOSVidClear,
                   spbOSPrivat, spbOSPrivatClear,
                   spbOSGr, spbOSGrClear,
                   spbOSKlass, spbOSKlassClear,

                   rdbOSF_amortY, rdbOSF_amortN,
                   dtpOSDt_vypusk,dtpOSDt_posting,
                   edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n,
                   edtOSKod_nal_nakl,
                   edtOSKod_zatr, edtOSKod_oborud,
                   edtOSPrimechan{, memOSCharacters}], lock);

  // Лочим/разлочиваем кнопки "Редагувати", "Зберегти" и "Відмінити" (в зависимости от режима)
  if lock then
  begin
    DisableControls([btnOSDataEdit], false);
    DisableControls([btnOSDataSave], true);
    DisableControls([btnOSDataCancel], true);
  end
  else begin
    DisableControls([btnOSDataEdit], true);
    DisableControls([btnOSDataSave], false);
    DisableControls([btnOSDataCancel], false);
  end;
end;


procedure TfrmENBuildingEdit.updateOSDataTab;
var
  TempENBuilding2OSData: EnBuilding2OSDataControllerSoapPort;
  osDataFilter: ENBuilding2OSDataFilter;
  osDataList: ENBuilding2OSDataShortList;
begin
  dtpOSDt_vypusk.Date := SysUtils.Date;
  dtpOSDt_vypusk.Checked := false;
  dtpOSDt_posting.Date := SysUtils.Date;
  dtpOSDt_posting.Checked := false;
  rdbOSF_amortY.Checked := true;

  ClearControls([edtOSIstCode, edtOSIst
                ,edtOSSubschCode, edtOSSubsch
                ,edtOSVidCode, edtOSVid
                ,edtOSPrivatCode, edtOSPrivat
                ,edtOSGrCode, edtOSGr
                ,edtOSKlassCode, edtOSKlass
                ,edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n
                ,edtOSKod_zatr, edtOSKod_oborud
                ,edtOSPrimechan, memOSCharacters
                ,edtOSKod_nal_nakl
                ,edtOSNum_un, edtOSKod_inv]);

  ///// Значения по умолчанию
//        edtOSIstCode.Text := '07';
//  edtOSIst.Text := 'ПРИХОД ОСНОВНОГО СРЕДСТВА С КАПСТРОЯ';
//
//  edtOSSubschCode.Text := '1511';
//  edtOSSubsch.Text := 'КАПИТАЛЬНОЕ СТРОИТЕЛЬСТВО';
//  edtOSGrCode.Text := '1';
//  edtOSGr.Text := 'ПРОМЫШЛЕННО-ПРОИЗВ.ОС';
//
//  edtOSKod_zatr.Text := '000000000000000';
//
  edtOSSum_st_perv_n.Text := edtSummaGen.Text;
  edtOSKod_nal_nakl.Text := numberDoc;
  memOSCharacters.Lines := edtCharacteristic.Lines; // характеристика берем со вкладки основное
  /////

  OSData := nil;

  osDataFilter := ENBuilding2OSDataFilter.Create;
  SetNullIntProps(osDataFilter);
  SetNullXSProps(osDataFilter);

  osDataFilter.ENBuildingRef := ENBuildingRef.Create;
  osDataFilter.ENBuildingRef.code := ENBuildingObj.code;

  TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;

  osDataList := TempENBuilding2OSData.getScrollableFilteredList(osDataFilter, 0, -1);
  if osDataList.totalCount > 0 then
  begin
    if osDataList.list[0] <> nil then
      if osDataList.list[0].code > LOW_INT then
        OSData := TempENBuilding2OSData.getObject(osDataList.list[0].code);
  end
  else
    OSData := nil;

  if OSData <> nil then
    if OSData.code > LOW_INT then
    begin
      edtOSIstCode.Text := OSData.kod_ist;
      edtOSIst.Text := OSData.name_ist;

      edtOSSubschCode.Text := OSData.kod_subsch;
      edtOSSubsch.Text := OSData.name_subsch;

      edtOSVidCode.Text := OSData.kod_vid;
      edtOSVid.Text := OSData.name_vid;

      edtOSPrivatCode.Text := OSData.kod_privat;
      edtOSPrivat.Text := OSData.name_privat;

      edtOSGrCode.Text := OSData.kod_gr;
      edtOSGr.Text := OSData.name_gr;

      if OSData.num_klass > LOW_INT then
      begin
        edtOSKlassCode.Text := IntToStr(OSData.num_klass);
        edtOSKlass.Text := OSData.name_klass;
      end
      else begin
        edtOSKlassCode.Text := '';
        edtOSKlass.Text := '';
      end;

      if OSData.f_amort = 'Y' then
        rdbOSF_amortY.Checked := true
      else
        rdbOSF_amortN.Checked := true;

      if OSData.dt_vypusk <> nil then
      begin
        dtpOSDt_vypusk.DateTime := EncodeDate(OSData.dt_vypusk.Year,
                                              OSData.dt_vypusk.Month,
                                              OSData.dt_vypusk.Day);
        dtpOSDt_vypusk.Checked := true;
      end
      else begin
        dtpOSDt_vypusk.DateTime := SysUtils.Date;
        dtpOSDt_vypusk.Checked := false;
      end;

      if OSData.sum_izn_perv <> nil then
        edtOSSum_izn_perv.Text := OSData.sum_izn_perv.DecimalString
      else
        edtOSSum_izn_perv.Text := '';

      if OSData.sum_izn_perv_n <> nil then
        edtOSSum_izn_perv_n.Text := OSData.sum_izn_perv_n.DecimalString
      else
        edtOSSum_izn_perv_n.Text := '';

      if OSData.sum_st_perv_n <> nil then
        edtOSSum_st_perv_n.Text := OSData.sum_st_perv_n.DecimalString
      else
        //edtOSSum_st_perv_n.Text := '';
        edtOSSum_st_perv_n.Text := edtSummaGen.Text;

      edtOSKod_zatr.Text := OSData.kod_zatr;

      edtOSKod_oborud.Text := OSData.kod_oborud;

      edtOSPrimechan.Text := OSData.primechan;
      MakeMultiline(memOSCharacters.Lines, OSData.characters);

      if OSData.kod_nal_nakl <> '' then
        edtOSKod_nal_nakl.Text := OSData.kod_nal_nakl
      else
        edtOSKod_nal_nakl.Text := numberDoc;

      /////
      if OSData.num_un > LOW_INT then
        edtOSNum_un.Text := IntToStr(OSData.num_un)
      else
        edtOSNum_un.Text := '';

      edtOSKod_inv.Text := OSData.kod_inv;


      if OSData.datePosting <> nil then
      begin
        dtpOSDt_posting.DateTime := EncodeDate(OSData.datePosting.Year,
                                              OSData.datePosting.Month,
                                              OSData.datePosting.Day);
        dtpOSDt_posting.Checked := true;
      end
      else begin
        dtpOSDt_posting.DateTime := SysUtils.Date;
        dtpOSDt_posting.Checked := false;
      end;
      /////
    end;
end;

procedure TfrmENBuildingEdit.UpdateGridsgENBuilding2ServicesObject(Sender: TObject);
var
  TempENBuilding2ServicesObject: ENBuilding2ServicesObjectControllerSoapPort;
  j,a,i,ColCount,LastCount: Integer;
  ENBuilding2ServicesObjectList: ENBuilding2ServicesObjectShortList;
  FilterObject:ENBuilding2ServicesObjectFilter;
begin

  for a:=1 to sgENBuilding2ServicesObject.RowCount-1 do
   for j:=0 to sgENBuilding2ServicesObject.ColCount-1 do
     sgENBuilding2ServicesObject.Cells[j,a]:='';

  SetGridHeaders(ENBuilding2ServicesObjectHeaders, sgENBuilding2ServicesObject.ColumnHeaders);
  ColCount:=100;
  TempENBuilding2ServicesObject :=  HTTPRIOENBuilding2ServicesObject as ENBuilding2ServicesObjectControllerSoapPort;

     FilterObject := ENBuilding2ServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);

   FilterObject.ENBuildingRef:= ENBuildingRef.Create;
   FilterObject.ENBuildingRef.code := ENBuildingObj.code;


  ENBuilding2ServicesObjectList := TempENBuilding2ServicesObject.getScrollableFilteredList(FilterObject,0,ColCount);
  LastCount:=High(ENBuilding2ServicesObjectList.list);

  if LastCount > -1 then
     sgENBuilding2ServicesObject.RowCount:=LastCount+2
  else
     sgENBuilding2ServicesObject.RowCount:=2;

   with sgENBuilding2ServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilding2ServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilding2ServicesObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuilding2ServicesObjectList.list[i].contractNumber;
        Objects[0, i+1] := ENBuilding2ServicesObjectList.list[i];
        if ENBuilding2ServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENBuilding2ServicesObjectList.list[i].contractDate);
        Objects[0, i+1] := ENBuilding2ServicesObjectList.list[i];
        Cells[3,i+1] := ENBuilding2ServicesObjectList.list[i].partnerName;
        Objects[0, i+1] := ENBuilding2ServicesObjectList.list[i];
        Cells[4,i+1] := ENBuilding2ServicesObjectList.list[i].partnerCode;
        Objects[0, i+1] := ENBuilding2ServicesObjectList.list[i];
        LastRow:=i+1;
        sgENBuilding2ServicesObject.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENBuilding2ServicesObject.Row:=1;

    sgENBuilding2ServicesObject.Row:=1;
end;

end.