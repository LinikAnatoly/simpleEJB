
unit EditENReconstrModernOZ;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, DFDocSignerController,
	EnergyproController, EnergyproController2, ENReconstrModernOZController , ENReconstrModern2OSDataController,
  ExtCtrls, AdvObj, TB2Item, TB2Dock, TB2Toolbar ;

type
    TfrmENReconstrModernOZEdit = class(TDialogForm)
    pgc1: TPageControl;
    tsMain: TTabSheet;
    tsAct: TTabSheet;
    lblNumbergen: TLabel;
    lblDateGen: TLabel;
    edtNumbergen: TEdit;
    edtDateGen: TDateTimePicker;
    GroupBox1: TGroupBox;
    lblInvNumber: TLabel;
    spbOSSelect: TSpeedButton;
    lblBuhName: TLabel;
    lblCodeMol: TLabel;
    lblCodePodr: TLabel;
    edtInvNumber: TEdit;
    edtBuhName: TEdit;
    edtCodeMol: TEdit;
    edtCodePodr: TEdit;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    edtDepartment: TEdit;
    lblSummaGen: TLabel;
    lblContractPrice: TLabel;
    edtSummaGen: TEdit;
    edtContractPrice: TEdit;
    lblCharacteristic: TLabel;
    edtCharacteristic: TMemo;
    lblExecutedPosition: TLabel;
    lblExecutedName: TLabel;
    lblAcceptedPosition: TLabel;
    lblAcceptedName: TLabel;
    edtExecutedPosition: TEdit;
    edtExecutedName: TEdit;
    edtAcceptedPosition: TEdit;
    edtAcceptedName: TEdit;
    HTTPRIOENReconstrModernOZ: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    HTTPRIOENReconstrModernOZ2ENact: THTTPRIO;
    sgENAct: TAdvStringGrid;
    actUpdateGridAct: TAction;
    HTTPRIOENAct: THTTPRIO;
    tsOSData: TTabSheet;
    grpNalogAccounting: TGroupBox;
    grpBuhAccounting: TGroupBox;
    lblSum_dovvod_n: TLabel;
    edtSum_dovvod_n: TEdit;
    lblSum_dovvod_izn_n: TLabel;
    edtSum_dovvod_izn_n: TEdit;
    lblSum_dovvod_b: TLabel;
    edtSum_dovvod_b: TEdit;
    lblSum_dovvod_izn_b: TLabel;
    edtSum_dovvod_izn_b: TEdit;
    Label1: TLabel;
    lblSummaNDS: TLabel;
    lblSum_dovvod_nds_b: TLabel;
    edtSum_dovvod_nds_b: TEdit;
    lblSum_nds: TLabel;
    edtSum_nds: TEdit;
    edtSummaNDS: TEdit;
    grp1: TGroupBox;
    lblName_dovvod: TLabel;
    edtName_dovvod: TEdit;
    lblKod_nakl: TLabel;
    edtKod_nakl: TEdit;
    lblDt_nakl: TLabel;
    edtDt_nakl: TDateTimePicker;
    lblKod_nal_nakl: TLabel;
    edtKod_nal_nakl: TEdit;
    Label2: TLabel;
    edtOSIstCode: TEdit;
    edtOSIst: TEdit;
    spbOSIst: TSpeedButton;
    spbOSIstClear: TSpeedButton;
    HTTPRIOENReconstrModern2OSData: THTTPRIO;
    btnOSDataEdit: TBitBtn;
    btnOSDataSave: TBitBtn;
    btnOSDataCancel: TBitBtn;
    lblKod_postav: TLabel;
    edtKod_postav: TEdit;
    lblKod_dogovor: TLabel;
    edtKod_dogovor: TEdit;
    edtName_postav: TEdit;
    edtDate_dogovor: TDateTimePicker;
    btnPrintOrder: TButton;
    chkisInvestProgram: TCheckBox;
    grpisInvest: TGroupBox;
    lblYearInvestProgram: TLabel;
    edtYearInvestProgram: TEdit;
    lblItemInvestProgram: TLabel;
    edtItemInvestProgram: TEdit;
    edtInvestProgramGroupsName: TEdit;
    spbInvestProgramGroups: TSpeedButton;
    lblRazdelInvProgram: TLabel;
    HTTPRIOENInvestProgramGroups: THTTPRIO;
    Panel1: TPanel;
    Label3: TLabel;
    rgtypeRM: TRadioGroup;
    tsActProject: TTabSheet;
    panelActProject: TPanel;
    ToolBar2: TToolBar;
    tbactProjectView: TToolButton;
    tbactProjectInsert: TToolButton;
    tbactProjectRemove: TToolButton;
    tbactProjectEdit: TToolButton;
    tbactProjectUpdate: TToolButton;
    tbactProjectFilter: TToolButton;
    tbactProjectNoFilter: TToolButton;
    sgENActProj2OZ2: TAdvStringGrid;
    HTTPRIOENActProj2OZ2: THTTPRIO;
    actUpdateGridActProject: TAction;
    Panel2: TPanel;
    Label4: TLabel;
    Panel3: TPanel;
    lbl1: TLabel;
    ToolBar3: TToolBar;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    sgENActProj2OZ2Date: TAdvStringGrid;
    actInsertDateForActProject: TAction;
    actUpdateGridDateForActProject: TAction;
    HTTPRIOENActProj2OZ2Date: THTTPRIO;
    actDeleteDateForActProject: TAction;
    PopupMenu2: TPopupMenu;
    miisCalculationDateTrue: TMenuItem;
    miisCalculationDateFalse: TMenuItem;
    actisCalculationDateTrue: TAction;
    actisCalculationDateFalse: TAction;
    edtTermUseful: TEdit;
    HTTPRIOENServicesObject: THTTPRIO;
    lblTermUseful: TLabel;
    Label5: TLabel;
    edtUse_limit_n_before: TEdit;
    Label6: TLabel;
    edtUse_limit_before: TEdit;
    Label7: TLabel;
    edtUse_limit_n_current: TEdit;
    Label8: TLabel;
    edtUse_limit_current: TEdit;
    lblServicesName: TLabel;
    edtServicesName: TEdit;
    spbENServicesObject: TSpeedButton;
    GroupBox2: TGroupBox;
    lblDateExploitationIn: TLabel;
    lblDateExploitationOut: TLabel;
    edtDateExploitationOut: TDateTimePicker;
    edtDateExploitationIn: TDateTimePicker;
    tsDFDoc: TTabSheet;
    alDoc: TActionList;
    actClearDFDocSigners: TAction;
    actViewDFDoc: TAction;
    actUpdateDFDocs: TAction;
    actSaveDFDocSigners: TAction;
    gbDFDocSigners: TGroupBox;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    sgDFDocSigners: TAdvStringGrid;
    gbDFDocs: TGroupBox;
    ToolBar18: TToolBar;
    ToolButton95: TToolButton;
    ToolButton101: TToolButton;
    sgDFDocs: TAdvStringGrid;
    lblCode: TLabel;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbOSSelectClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateGridActExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    function  getSummaGenByOZ(codeOz : integer):Double;
    function  getcontractpriceByOZ(codeOz : integer):Double;
    procedure spbOSIstClick(Sender: TObject);
    procedure spbOSIstClearClick(Sender: TObject);
    procedure updateOSDataTab;
    procedure btnOSDataEditClick(Sender: TObject);
    procedure LockUnlockOSData(lock: Boolean = true);
    procedure btnOSDataSaveClick(Sender: TObject);
    procedure pgc1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure btnOSDataCancelClick(Sender: TObject);
    procedure btnPrintOrderClick(Sender: TObject);
    procedure chkisInvestProgramClick(Sender: TObject);
    procedure spbInvestProgramGroupsClick(Sender: TObject);
    procedure actUpdateGridActProjectExecute(Sender: TObject);
    procedure actInsertDateForActProjectExecute(Sender: TObject);
    procedure actUpdateGridDateForActProjectExecute(Sender: TObject);
    procedure actDeleteDateForActProjectExecute(Sender: TObject);
    procedure sgENActProj2OZ2Click(Sender: TObject);
    procedure actisCalculationDateTrueExecute(Sender: TObject);
    procedure actisCalculationDateFalseExecute(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    function  getPartnerCodeByOZ(codeOz : integer):String;
    function  getPartnerNameByOZ(codeOz : integer):String;
    function  getfinContractNumberByOZ(codeOz : integer):String;
    function  getfinContractDateByOZ(codeOz : integer):TdateTime
    ;
    procedure spbENServicesObjectClick(Sender: TObject);
    procedure actClearDFDocSignersExecute(Sender: TObject);
    procedure actViewDFDocExecute(Sender: TObject);
    procedure actUpdateDFDocsExecute(Sender: TObject);
  
  private
    { Private declarations }
    OSData: ENReconstrModern2OSData;
    AllowClose: Boolean;
    sum : Double ;

    procedure initDFDocsTab;
    procedure initDFDocSignersGrid(setDefaultSigners: Boolean = true);
    procedure loadDFDocSigners;
    function getDFDocSignersForSaving(var dfDocSigners: ArrayOfDFDocSigner): Boolean;
    procedure updateDFDocs;
  public
    { Public declarations }
    statusCode : Integer;
    ENReconstrModernOZObj: ENReconstrModernOZ;
  end;

var
  frmENReconstrModernOZEdit: TfrmENReconstrModernOZEdit;

  ENActHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'ПІБ МВО з Фін. Кол.'
          ,'Тип'
          ,'Статус'
          ,'Сума по акту'
          ,'Урахування дат по наряд завданням'
          //,'пользователь внесший изменение'
          //,'дата последнего изменения'
        );
  LastRow: Integer = 1;

  ENActProj2OZ2Headers: array [1..4] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'Сума по акту'
//          ,'Примітка'
//          ,'дата последнего изменения'
        );

        ENActProj2OZ2DateHeaders: array [1..2] of String =
        ( 'Код'
          ,'Дата проведення робіт по акту'
        );

implementation

uses
  ShowOStable, OSTableController, ShowENDepartment, ENDepartmentController, 
  ENConsts, ENActController, ENReconstrModernOZ2ENactController, ShowENAct, 
  ENPlanWorkStateController, EditENAct, ShowOSIst, OSIstController
  , DMReportsUnit, ShowENInvestProgramGroups, ENInvestProgramGroupsController,
  ENActProj2OZ2Controller, EditENActProj2OZ2, EditENActProj2OZ2Date,
  ENActProj2OZ2DateController, ENServicesObjectController,
  ShowENServicesConnection, ENServicesContractKindController,
  ENServicesContractTypeController, ENActAdd, ShowDocumentManagement;


{uses  
    EnergyproController, EnergyproController2, ENReconstrModernOZController  ;
}
{$R *.dfm}



procedure TfrmENReconstrModernOZEdit.FormShow(Sender: TObject);
    var
       TempENDepartment: ENDepartmentControllerSoapPort;
       investObj : ENInvestProgramGroups;
       TempENInvestProgramGroups : ENInvestProgramGroupsControllerSoapPort;
       use_limitDataArr : ENReconstrModernOZController.ArrayOfInteger;
       TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
       TempENServicesObject : ENServicesObjectControllerSoapPort;
       so : ENServicesObject;

begin

  SetFloatStyle([edtSummaGen, edtContractPrice, edtSum_dovvod_n, edtSum_dovvod_izn_n,
      edtSum_dovvod_b, edtSum_dovvod_izn_b, edtSum_dovvod_nds_b, edtSum_nds, edtSummaNDS , edtTermUseful ]);
  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  SetGridHeaders(ENActProj2OZ2Headers , sgENActProj2OZ2.ColumnHeaders);
  SetGridHeaders(ENActProj2OZ2DateHeaders , sgENActProj2OZ2Date.ColumnHeaders);
  sum := 0;

  DisableControls([edtUse_limit_n_before, edtUse_limit_before , edtUse_limit_n_current , edtUse_limit_current ]);

  if (DialogState = dsInsert) then
  begin
    HideControls([btnPrintOrder]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen  ,
      edtDateGen ,
      edtInvNumber ,
      edtBuhName  ,
      edtDepartment  ,
      edtCharacteristic
     ]);
   end;

   DisableControls([edtServicesName , edtCode , edtBuhName,edtCodeMol , edtCodePodr , edtDepartment  , edtInvNumber , edtInvestProgramGroupsName , edtSummaGen]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    statusCode :=  ENReconstrModernOZObj.statusRef.code;
    edtCode.Text := IntToStr(ENReconstrModernOZObj.code);
    edtNumbergen.Text := ENReconstrModernOZObj.numbergen;
      if ENReconstrModernOZObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENReconstrModernOZObj.dateGen.Year,ENReconstrModernOZObj.dateGen.Month,ENReconstrModernOZObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    if ( ENReconstrModernOZObj.summaGen <> nil ) then
       edtSummaGen.Text := ENReconstrModernOZObj.summaGen.decimalString
    else
       edtSummaGen.Text := '';
    if ( ENReconstrModernOZObj.summaNDS <> nil ) then
       edtSummaNDS.Text := ENReconstrModernOZObj.summaNDS.decimalString
    else
       edtSummaNDS.Text := '';
    MakeMultiline(edtCharacteristic.Lines, ENReconstrModernOZObj.characteristic);

    edtExecutedPosition.Text := ENReconstrModernOZObj.executedPosition; 
    edtExecutedName.Text := ENReconstrModernOZObj.executedName;
    edtAcceptedPosition.Text := ENReconstrModernOZObj.acceptedPosition;
    edtAcceptedName.Text := ENReconstrModernOZObj.acceptedName; 
    if ( ENReconstrModernOZObj.contractPrice <> nil ) then
       edtContractPrice.Text := ENReconstrModernOZObj.contractPrice.decimalString
    else
       edtContractPrice.Text := '';
    edtCodeMol.Text := ENReconstrModernOZObj.codeMol; 
    edtCodePodr.Text := ENReconstrModernOZObj.codePodr;
   // edtUserGen.Text := ENReconstrModernOZObj.userGen;
    edtInvNumber.Text := ENReconstrModernOZObj.invNumberOZ;
    edtBuhName.Text :=  ENReconstrModernOZObj.nameOZ;
    if ENReconstrModernOZObj.departmentRef <> nil then
     if ENReconstrModernOZObj.departmentRef.code <> low(Integer) then
     begin
       TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
       edtDepartment.Text := TempENDepartment.getObject(ENReconstrModernOZObj.departmentRef.code).shortName;
     end;

    edtYearInvestProgram.Text := ENReconstrModernOZObj.yearInvestProgram;
    edtItemInvestProgram.Text := ENReconstrModernOZObj.itemInvestProgram;

    if ( ENReconstrModernOZObj.isInvestProgram <> Low(Integer) ) then
      if ( ENReconstrModernOZObj.isInvestProgram <> 0 ) then
       chkisInvestProgram.Checked := True
    else
       chkisInvestProgram.Checked := False;


    if ( ENReconstrModernOZObj.termUseful <> Low(Integer) ) then
       edtTermUseful.Text := IntToStr(ENReconstrModernOZObj.termUseful)
    else
       edtTermUseful.Text := '';


    if ( ENReconstrModernOZObj.use_limit_before <> Low(Integer) ) then
       edtUse_limit_before.Text := IntToStr(ENReconstrModernOZObj.use_limit_before)
    else
       edtUse_limit_before.Text := '';

    if ( ENReconstrModernOZObj.use_limit_n_before <> Low(Integer) ) then
       edtUse_limit_n_before.Text := IntToStr(ENReconstrModernOZObj.use_limit_n_before)
    else
       edtUse_limit_n_before.Text := '';


    if ( ENReconstrModernOZObj.invNumberOZ <> null ) then
    begin
      TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
      use_limitDataArr := TempENReconstrModernOZ.getNalogAndBuhUseLimitByInv(ENReconstrModernOZObj.invNumberOZ ,
      ENReconstrModernOZObj.dateGen);

      if  (( edtUse_limit_n_before.Text = '' ) or (edtUse_limit_before.Text = '') and (DialogState = dsEdit)  ) then
     begin


      edtUse_limit_n_before.Text:= IntToStr( use_limitDataArr[0] );
      edtUse_limit_before.Text:= IntToStr( use_limitDataArr[1] );

     end;

     // скв на теперишній час
     edtUse_limit_n_current.Text:= IntToStr( use_limitDataArr[0] );
     edtUse_limit_current.Text:= IntToStr( use_limitDataArr[1] );

    end;



       if ENReconstrModernOZObj.invgroupRef = nil then
       ENReconstrModernOZObj.invgroupRef := ENInvestProgramGroupsRef.Create
    else
    if ENReconstrModernOZObj.invgroupRef.code > Low(Integer) then
    begin
         try
             TempENInvestProgramGroups :=  HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
             investObj := TempENInvestProgramGroups.getObject(ENReconstrModernOZObj.invgroupRef.code);
             if investObj <> nil then
             begin
                 edtInvestProgramGroupsName.Text := investObj.name;
             end;
         finally

         end;
    end;

            if (( chkisInvestProgram.Checked ) and (DialogState = dsEdit)) then
             begin
               DisableControls([edtYearInvestProgram , spbInvestProgramGroups , edtItemInvestProgram],false );
             end
            else if ( ( chkisInvestProgram.Checked = false  ) and (DialogState = dsEdit)) then
             begin
                DisableControls([edtYearInvestProgram , spbInvestProgramGroups , edtItemInvestProgram] );
                edtYearInvestProgram.Text := '';
                edtItemInvestProgram.Text := '';
                edtInvestProgramGroupsName.Text := '';
                if ENReconstrModernOZObj.invgroupRef <> nil then
                   ENReconstrModernOZObj.invgroupRef.code := LOW_INT;

             end;

             if (( chkisInvestProgram.Checked ) and (DialogState = dsView)) then
             DisableControls([edtYearInvestProgram , spbInvestProgramGroups , edtItemInvestProgram] );

//     if ENReconstrModernOZObj.typeRM = 1 then

      rgtypeRM.ItemIndex := ENReconstrModernOZObj.typeRM -1;


      if ENReconstrModernOZObj.servicesobject.code <> Low_int then
     begin
      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      so := TempENServicesObject.getObject(ENReconstrModernOZObj.servicesobject.code);
      edtServicesName.Text := so.contractNumberServices + ' | ' + so.contragentName;
     end;


    SetDateFieldForDateTimePicker(edtDateExploitationIn, ENReconstrModernOZObj.dateExploitationIn);
    SetDateFieldForDateTimePicker(edtDateExploitationOut, ENReconstrModernOZObj.dateExploitationOut);
  end;

    if  DialogState = dsView then begin
      DisableControls([spbOSSelect , spbDepartment , rgtypeRM, spbInvestProgramGroups, spbENServicesObject ]);
    end;
    if  DialogState = dsInsert then begin
      tsAct.TabVisible:= false ;
      tsActProject.TabVisible:= false ;
      DisableControls([edtYearInvestProgram , spbInvestProgramGroups , edtItemInvestProgram] );
    end;

    if ENReconstrModernOZObj.statusRef <> nil then
     if  ENReconstrModernOZObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT then
         tsOSData.TabVisible := False;
    if ENReconstrModernOZObj.statusRef = nil then
         tsOSData.TabVisible := False;


    // Редактировать бух. данные даем только для ордеров в статусе "Складений"
   DisableControls([btnOSDataEdit], (statusCode <> ENRECONSTRMODERNOZ_STATUS_SIGNED));
   /////
   // добавлять инвентарный на документ можно только при инсерте
   if ( DialogState <> dsInsert ) then
   DisableControls([spbOSSelect]);

  initDFDocsTab;
end;



procedure TfrmENReconstrModernOZEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  dfDocSigners: ArrayOfDFDocSigner;
  isSignable: Boolean;
begin
  SetFloatStyle([edtSummaGen , edtContractPrice]);

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumbergen    ,
      edtDateGen  ,
      edtInvNumber ,
      edtBuhName  ,
      edtDepartment   ,
      edtCharacteristic
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if ((edtDateExploitationIn.Checked = true ) and (edtDateExploitationOut.Checked = false))then
    begin
      Application.MessageBox(PChar('Не вказана дата виводу з експлуатації після реконструкції!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end;
    if ((edtDateExploitationIn.Checked = false ) and (edtDateExploitationOut.Checked = true))then
    begin
      Application.MessageBox(PChar('Не вказана дата вводу в експлуатацію для реконструкції!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end;

    isSignable := DMReports.isSignable(ENReconstrModernOZObj);

    //////
    if (isSignable)
         and (DialogState <> dsInsert) and (ENReconstrModernOZObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT)
         and (not DMReports.checkDFDocSigners(sgDFDocSigners)) then
    begin
      Application.MessageBox(PChar('Потрібно вказати всіх підписантів!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      pgc1.ActivePage := tsDFDoc;
      Action := caNone;
      Exit;
    end;
    /////

    SetLength(dfDocSigners, 0);

    if (isSignable) and (DialogState <> dsInsert) and (ENReconstrModernOZObj.statusRef.code = ENRECONSTRMODERNOZ_STATUS_DRAFT) then
    begin
      if not getDFDocSignersForSaving(dfDocSigners) then
      begin
        Action := caNone;
        Exit;
      end;
    end;

    TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;


     ENReconstrModernOZObj.numbergen := edtNumbergen.Text;

     if edtdateGen.checked then
     begin
       if ENReconstrModernOZObj.dateGen = nil then
          ENReconstrModernOZObj.dateGen := TXSDate.Create;
       ENReconstrModernOZObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENReconstrModernOZObj.dateGen := nil;

//     if edtdateEdit.checked then
//     begin 
//       if ENReconstrModernOZObj.dateEdit = nil then
//          ENReconstrModernOZObj.dateEdit := TXSDate.Create;
//       ENReconstrModernOZObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
//     end
//     else
//       ENReconstrModernOZObj.dateEdit := nil;

     if (ENReconstrModernOZObj.summaGen = nil ) then
       ENReconstrModernOZObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       ENReconstrModernOZObj.summaGen.decimalString := edtSummaGen.Text 
     else
       ENReconstrModernOZObj.summaGen := nil;

     ENReconstrModernOZObj.characteristic := edtCharacteristic.Text;

     ENReconstrModernOZObj.executedPosition := edtExecutedPosition.Text; 

     ENReconstrModernOZObj.executedName := edtExecutedName.Text; 

     ENReconstrModernOZObj.acceptedPosition := edtAcceptedPosition.Text;

     ENReconstrModernOZObj.acceptedName := edtAcceptedName.Text;

     if (ENReconstrModernOZObj.contractPrice = nil ) then
       ENReconstrModernOZObj.contractPrice := TXSDecimal.Create;
     if edtContractPrice.Text <> '' then
       ENReconstrModernOZObj.contractPrice.decimalString := edtContractPrice.Text 
     else
       ENReconstrModernOZObj.contractPrice := nil;

     ENReconstrModernOZObj.codeMol := edtCodeMol.Text; 

     ENReconstrModernOZObj.codePodr := edtCodePodr.Text;

    // ENReconstrModernOZObj.userGen := edtUserGen.Text;
     ENReconstrModernOZObj.nameOZ := Trim(edtBuhName.Text);
     ENReconstrModernOZObj.invNumberOZ :=  edtInvNumber.Text;

     if ( chkisInvestProgram.Checked = true ) then
       ENReconstrModernOZObj.isInvestProgram := 1
     else
       ENReconstrModernOZObj.isInvestProgram := 0;

       ENReconstrModernOZObj.yearInvestProgram := edtYearInvestProgram.Text;

       ENReconstrModernOZObj.itemInvestProgram := edtItemInvestProgram.Text;

       ENReconstrModernOZObj.typeRM := rgtypeRM.ItemIndex + 1;


       if ( edtTermUseful.Text <> '' ) then
       ENReconstrModernOZObj.termUseful := StrToInt(edtTermUseful.Text)
     else
       ENReconstrModernOZObj.termUseful := Low(Integer) ;


     if ( edtUse_limit_before.Text <> '' ) then
       ENReconstrModernOZObj.use_limit_before := StrToInt(edtUse_limit_before.Text)
     else
       ENReconstrModernOZObj.use_limit_before := Low(Integer) ;
     if ( edtUse_limit_n_before.Text <> '' ) then
       ENReconstrModernOZObj.use_limit_n_before := StrToInt(edtUse_limit_n_before.Text)
     else
       ENReconstrModernOZObj.use_limit_n_before := Low(Integer) ;

     ENReconstrModernOZObj.dateExploitationIn := GetTXSDateFromTDateTimePicker(edtDateExploitationIn);
     ENReconstrModernOZObj.dateExploitationOut := GetTXSDateFromTDateTimePicker(edtDateExploitationOut);

    if DialogState = dsInsert then
    begin
      ENReconstrModernOZObj.code:=low(Integer); 
      TempENReconstrModernOZ.add(ENReconstrModernOZObj);
    end
    else
    if DialogState = dsEdit then
    begin
      if High(dfDocSigners) > -1 then
        TempENReconstrModernOZ.save(ENReconstrModernOZObj, dfDocSigners)
      else
        TempENReconstrModernOZ.save(ENReconstrModernOZObj);
    end;
  end;
end;


procedure TfrmENReconstrModernOZEdit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
          // инвентарные ЛИНИЙ могут быть взяты с Подстанций (код обор 11).. СКадовск - 006089 !!!
    // f.conditionSQL := ' OSTABLE.KOD_VID in (3,11) '; // Линии как передающие утр-ва

     if length(edtInvNumber.Text) > 0 then
       f.kod_inv := '*' + edtInvNumber.Text + '*';

     f.orderBySQL :=  'OSTABLE.STR_NAME';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);

   try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
            try
               
               edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
               edtBuhName.Text := GetReturnValue(sgOSTable,1);
               edtCodeMol.Text := GetReturnValue(sgOSTable,5);
               edtCodePodr.Text := GetReturnValue(sgOSTable,6);

               DisableControls([edtInvNumber, edtBuhName]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmOSTableShow.Free;
   end;
end;


procedure TfrmENReconstrModernOZEdit.spbDepartmentClick(Sender: TObject);
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
               if ENReconstrModernOZObj.departmentRef= nil then ENReconstrModernOZObj.departmentRef := ENDepartmentRef.Create();
               ENReconstrModernOZObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENReconstrModernOZEdit.spbENServicesObjectClick(Sender: TObject);
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

    DisableActions([frmShowENServicesConnection.actNoFilter,frmShowENServicesConnection.actEdit]);
  try
		with frmShowENServicesConnection do
			if ShowModal = mrOk then begin

				try
					servicesObjectCode := StrToInt(GetReturnValue(sgENServicesObject,0));
        except on EConvertError do Exit;
				end;

        ENReconstrModernOZObj.servicesobject := ENServicesObjectRef.Create;
        ENReconstrModernOZObj.servicesobject.code := servicesObjectCode;

        edtServicesName.Text := GetReturnValue(sgENServicesObject,1) + ' | ' + GetReturnValue(sgENServicesObject,5);

			end;
	finally
        frmShowENServicesConnection.Free;
     end;
end;

procedure TfrmENReconstrModernOZEdit.FormCreate(Sender: TObject);
begin
  inherited;
    pgc1.ActivePage := tsMain;
    statusCode := LOW_INT;
end;

procedure TfrmENReconstrModernOZEdit.actInsertExecute(Sender: TObject);
var
f : ENActFilter;
frmENActShow : TfrmENActShow;
r2a  : ENReconstrModernOZ2ENact;
TempENReconstrModernOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
begin

  //inherited;
  if (ENReconstrModernOZObj.statusRef.code <> ENRECONSTRMODERNOZ_STATUS_DRAFT) then
  begin
      Application.MessageBox(PChar(' Додавати акти можливо тільки якщо Документ ОЗ-2 знаходиться в черновому статусі!!! '),
                    PChar('Увага !'),MB_ICONWARNING );
      Exit;
  end;

  if pgc1.ActivePage = tsAct then
   Begin
      begin
          frmENActAdd := TfrmENActAdd.Create(Application, dsInsert);
          frmENActAdd.ENReconstrModernOZObjCode:= ENReconstrModernOZObj.code;
            try
               frmENActAdd.invNumberOZ:= ENReconstrModernOZObj.invNumberOZ;
               frmENActAdd.servicesobjectcode := ENReconstrModernOZObj.servicesobject.code;

               if frmENActAdd.ShowModal = mrOK then
               begin

                end;
            finally
               frmENActAdd.Free;
               frmENActAdd := nil;
            end;

            actUpdateGridActExecute(sender);

        end;

       {// перенос добавления актов на форму frmENActAdd
        f := ENActFilter.Create;
        SetNullIntProps(f);
        SetNullXSProps(f);

        // выберем акты по объектам  energyNET которые имеют инвентарный который забит в документе ОЗ
        //  и которые не привязаные к связке ОЗ2и акты (ENReconstrModernOZ2Enact)
        f.conditionSQL := ' enact.code in ( Select a.code from enact a  , enelementdata eld   ' +
                              ' where a.elementcode = eld.ecode ' +
                              ' and a.acttyperefcode in ( ' + IntToStr(ENPLANWORKSTATE_RECONSTRUCTION) + ' ,  ' + IntToStr(ENPLANWORKSTATE_TMC_TRANSFER) + ' )  ' +
                              ' and eld.invnumber = ' +chr(39)+ ENReconstrModernOZObj.invNumberOZ +chr(39) +
                              ' and a.statusrefcode in (' + IntToStr( ENACT_CLOSED) + ',' + IntToStr(ENACT_SIGNATURE) + ')' +
                              ' and a.code not in (select distinct r2a.actrefcode from enreconstrmodernoz2nct r2a )   )';


         frmENActShow:=TfrmENActShow.Create(Application,fmNormal, f);
         try

            DisableActions([frmENActShow.actFilter , frmENActShow.actNoFilter]);
            frmENActShow.isFiltered := true;


            with frmENActShow do begin
              DisableActions([ actEdit, actDelete , actInsert, actFilter, actNoFilter]);
              if ShowModal = mrOk then
              begin


                          TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;

                          r2a:=ENReconstrModernOZ2ENact.Create;
                          r2a.actRef := ENActRef.Create;
                          r2a.ENReconstrModernOZRef :=  ENReconstrModernOZRef.Create;

                          r2a.code := LOW_INT;
                          r2a.ENReconstrModernOZRef.code := ENReconstrModernOZObj.code;
                          r2a.actRef.code := StrToInt(GetReturnValue(sgENAct,0));

                          TempENReconstrModernOZ2ENact.add(r2a);
                          actUpdateGridActExecute(sender);





                    end;
                  end;
         finally
            frmENActShow.Free;
         end;
        }
   end;
   // если вкладка акты проектные без EnergyNET откроем форму добавления 
   if pgc1.ActivePage = tsActProject then
   Begin
        ENActProj2OZ2Obj:=ENActProj2OZ2.Create;
        ENActProj2OZ2Obj.ENReconstrModernOZRef := ENReconstrModernOZRef.Create;
        ENActProj2OZ2Obj.ENReconstrModernOZRef.code := ENReconstrModernOZObj.code;  

        
        try
          frmENActProj2OZ2Edit:=TfrmENActProj2OZ2Edit.Create(Application, dsInsert);
          try
            if frmENActProj2OZ2Edit.ShowModal = mrOk then
            begin
              if ENActProj2OZ2Obj<>nil then
                  actUpdateGridActProjectExecute(Sender);
            end;
          finally
            frmENActProj2OZ2Edit.Free;
            frmENActProj2OZ2Edit:=nil;
          end;
        finally
          ENActProj2OZ2Obj.Free;
        end;
   end;


    edtSummaGen.Text := FloatToStr(getSummaGenByOZ(ENReconstrModernOZObj.code));
    edtContractPrice.Text :=  FloatToStr(getcontractpriceByOZ(ENReconstrModernOZObj.code));

    ENReconstrModernOZObj.partnerCode := getPartnerCodeByOZ(ENReconstrModernOZObj.code);
    ENReconstrModernOZObj.partnerName := getPartnerNameByOZ(ENReconstrModernOZObj.code);
    ENReconstrModernOZObj.finContractNumber := getfinContractNumberByOZ(ENReconstrModernOZObj.code);

    if getfinContractDateByOZ(ENReconstrModernOZObj.code) <> 0  then
     begin
       if ENReconstrModernOZObj.finContractDate = nil then
          ENReconstrModernOZObj.finContractDate := TXSDate.Create;
       ENReconstrModernOZObj.finContractDate.XSToNative(GetXSDate(getfinContractDateByOZ(ENReconstrModernOZObj.code)));
     end
     else
       ENReconstrModernOZObj.finContractDate := nil;


end;

procedure TfrmENReconstrModernOZEdit.actUpdateGridActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  actDate: String;
  LastCount  , i : integer;

   TempRMOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
   RMOZ2ENactFilter : ENReconstrModernOZ2ENactFilter;
   RMOZ2ENactList : ENReconstrModernOZ2ENactShortList;

begin
   ClearGrid(sgENAct);

   TempRMOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;

    RMOZ2ENactFilter := ENReconstrModernOZ2ENactFilter.Create;
    SetNullIntProps(RMOZ2ENactFilter);
    SetNullXSProps(RMOZ2ENactFilter);

    RMOZ2ENactFilter.ENReconstrModernOZRef:= ENReconstrModernOZRef.Create;
    RMOZ2ENactFilter.ENReconstrModernOZRef.code := ENReconstrModernOZObj.code;

    RMOZ2ENactList := TempRMOZ2ENact.getScrollableFilteredListForRM(RMOZ2ENactFilter, 0, -1);

      LastCount := High(RMOZ2ENactList.list);
     // sum := 0;

    if LastCount > -1 then
      sgENAct.RowCount := LastCount + 2
    else
      sgENAct.RowCount := 2;
      with sgENAct do
      for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RMOZ2ENactList.list[i].actRefCode <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RMOZ2ENactList.list[i].actRefCode)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := RMOZ2ENactList.list[i].actRefNumberGen;
        if RMOZ2ENactList.list[i].actRefDateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RMOZ2ENactList.list[i].actRefDateGen);

        if (i = 0) then
          actDate := Cells[2, i + 1];

        Cells[3,i+1] := RMOZ2ENactList.list[i].actRefFinMolName;
        Cells[4,i+1] := RMOZ2ENactList.list[i].actRefFinMechanicName; // тип акта   actTypeRefName;
        Cells[5,i+1] := RMOZ2ENactList.list[i].actRefUserGen; // статус акта  //statusRefName;

        if ( RMOZ2ENactList.list[i].sumgen <> nil ) then
        Cells[6,i+1] := RMOZ2ENactList.list[i].sumgen.decimalString
        else
        Cells[6,i+1] := '';
        if ( RMOZ2ENactList.list[i].sumgen <> nil ) then
          sum := sum +  StrToFloat(RMOZ2ENactList.list[i].sumgen.DecimalString);

        if (RMOZ2ENactList.list[i].isCalculationDate = 1) then
            AddCheckBox(7, i + 1, true, false)
          else
            AddCheckBox(7, i + 1, False, false);



        sgENAct.RowCount := i + 2;
      end;

    sgENAct.Row := 1;

    // Panel1.Caption := SeparateThousands(FloatToStr(sum));
   // if Trim(Panel1.Caption) = '' then Panel1.Caption := '0';
   // Panel1.Caption := SeparateThousands(FloatToStr(StrToFloat(Panel1.Caption) + sum));

end;

procedure TfrmENReconstrModernOZEdit.actDeleteExecute(Sender: TObject);
 var
 TempENReconstrModernOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
 ObjCode : Integer;
 r2actFilter : ENReconstrModernOZ2ENactFilter;
 r2actList : ENReconstrModernOZ2ENactShortList;
 r2actCode : Integer;

 TempENActProj2OZ2: ENActProj2OZ2ControllerSoapPort;
 ObjActProjectCode: Integer;

 begin

  if (ENReconstrModernOZObj.statusRef.code <> ENRECONSTRMODERNOZ_STATUS_DRAFT) then
  begin
      Application.MessageBox(PChar(' Видаляти акти з прив`язки можливо тільки якщо Документ ОЗ-2 знаходиться в черновому статусі!!! '),
                    PChar('Увага !'),MB_ICONWARNING );
      Exit;
  end;

  if pgc1.ActivePage = tsAct then
  begin


          TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;


            r2actCode := 0;
           try
             ObjCode := StrToInt(sgENAct.Cells[0,sgENAct.Row]);
     
           except
           on EConvertError do Exit;
           end;

           try
                    r2actFilter := ENReconstrModernOZ2ENactFilter.Create;

                    SetNullIntProps(r2actFilter);
                    SetNullXSProps(r2actFilter);

                   r2actFilter.actRef := ENActRef.Create;
                   r2actFilter.actRef.code := ObjCode;


                   r2actList := TempENReconstrModernOZ2ENact.getScrollableFilteredList(r2actFilter,0,-1);
                   if r2actList.totalCount > 0 then
                   begin
                       r2actCode := r2actList.list[0].code; 
                   end;
                 finally
                   r2actFilter.Free;
                 end;

          if Application.MessageBox(PChar('Вы действительно хотите удалить расходный акт из документа ОЗ ?'),
                            PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
          begin
             if r2actCode <> 0 then
             begin
              TempENReconstrModernOZ2ENact.remove(r2actCode);
              actUpdateGridActExecute(Sender);
              edtSummaGen.Text := FloatToStr(getSummaGenByOZ(ENReconstrModernOZObj.code));
              edtContractPrice.Text :=  FloatToStr(getcontractpriceByOZ(ENReconstrModernOZObj.code));
              end;
          end;


  end;

   if pgc1.ActivePage = tsActProject then
  begin
         TempENActProj2OZ2 := HTTPRIOENActProj2OZ2 as ENActProj2OZ2ControllerSoapPort;
       try
         ObjActProjectCode := StrToInt(sgENActProj2OZ2.Cells[0,sgENActProj2OZ2.Row]);
       except
       on EConvertError do Exit;
      end;
      if Application.MessageBox(PChar('Вы действительно хотите удалить (Акти виконаних робіт(проектування для ОЗ-2)) ?'),
                        PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENActProj2OZ2.remove(ObjActProjectCode);
          actUpdateGridActProjectExecute(Sender);

          edtSummaGen.Text := FloatToStr(getSummaGenByOZ(ENReconstrModernOZObj.code));
          edtContractPrice.Text :=  FloatToStr(getcontractpriceByOZ(ENReconstrModernOZObj.code));
      end;


  end;
end;

procedure TfrmENReconstrModernOZEdit.pgc1Change(Sender: TObject);
begin
 // inherited;
  if pgc1.ActivePage = tsAct then
    begin
     if ( DialogState = dsView ) then
        DisableActions([actInsert, actDelete , actUpdate]);
        actUpdateGridActExecute(Sender);
        getSummaGenByOZ(ENReconstrModernOZObj.code);
    end
  else if pgc1.ActivePage = tsOSData then
   begin
    updateOSDataTab;
    LockUnlockOSData();
   end
   else if pgc1.ActivePage = tsActProject then
    begin
     if ( DialogState = dsView ) then
        DisableActions([actInsert, actDelete, actUpdate , actInsertDateForActProject  , actDeleteDateForActProject]);
        actUpdateGridActProjectExecute(Sender);
        getSummaGenByOZ(ENReconstrModernOZObj.code);
    end

  else if pgc1.ActivePage = tsDFDoc then
  begin
    updateDFDocs;
  end;

   // if Trim(Panel1.Caption) = '' then Panel1.Caption := '0';
   // Panel1.Caption := SeparateThousands(FloatToStr(StrToFloat(Panel1.Caption) + sum));
   // if Trim(Panel2.Caption) = '' then Panel2.Caption := '0';
   // Panel2.Caption := SeparateThousands(FloatToStr(StrToFloat(Panel2.Caption) + sum));
end;

procedure TfrmENReconstrModernOZEdit.actViewDFDocExecute(Sender: TObject);
begin
  ShowDocumentManagement.openDFDocForViewFromGrid(ENReconstrModernOZObj, Self, sgDFDocs);
end;

procedure TfrmENReconstrModernOZEdit.actViewExecute(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
TempENActProj2OZ2: ENActProj2OZ2ControllerSoapPort;
begin
  if pgc1.ActivePage = tsAct then
  begin
    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    frmENActEdit := TfrmENActEdit.Create(Application, dsView);
    try
      DisableActions([frmENActEdit.actDelete]);
      try
        frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0,sgENAct.Row]));
      except
        on EConvertError do Exit;
      end;

      if frmENActEdit.ShowModal in [mrOk ,mrYes ] then
        begin

          actUpdateGridActExecute(sender);
        end;

    finally
      frmENActEdit.Free;
      frmENActEdit:=nil;
    end;
   end;

   if pgc1.ActivePage = tsActProject then
   begin
           TempENActProj2OZ2 := HTTPRIOENActProj2OZ2 as ENActProj2OZ2ControllerSoapPort;
         try
           ENActProj2OZ2Obj := TempENActProj2OZ2.getObject(StrToInt(sgENActProj2OZ2.Cells[0,sgENActProj2OZ2.Row]));
         except
         on EConvertError do Exit;
        end;
         frmENActProj2OZ2Edit:=TfrmENActProj2OZ2Edit.Create(Application, dsView);
        try
          frmENActProj2OZ2Edit.ShowModal;
        finally
          frmENActProj2OZ2Edit.Free;
          frmENActProj2OZ2Edit:=nil;
        end;
   end;

      
end;

procedure TfrmENReconstrModernOZEdit.actUpdateDFDocsExecute(Sender: TObject);
begin
  updateDFDocs;
end;

procedure TfrmENReconstrModernOZEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
   if pgc1.ActivePage = tsAct then
   actUpdateGridActExecute(sender);

   if pgc1.ActivePage = tsActProject then
   actUpdateGridActProjectExecute(Sender);
end;

function  TfrmENReconstrModernOZEdit.getSummaGenByOZ(codeOz : integer):Double;
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  OZObj : ENReconstrModernOZ;
begin

  TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
  OZObj :=  TempENReconstrModernOZ.getObject(codeOz);

  if ( OZObj.summaGen <> nil ) then
   if ( OZObj.summaGen.decimalString <> '0' ) then
  result := StrToFloat( OZObj.summaGen.decimalString)
  else
  result := 0;


  edtSummaGen.Text := FloatToStr(result);  // OZObj.summaGen.decimalString; // FloatToStr(getSummaGenByOZ(ENReconstrModernOZObj.code));
  Panel1.Caption :=  FloatToStr(result); // OZObj.summaGen.decimalString;
  Panel2.Caption := FloatToStr(result); // OZObj.summaGen.decimalString;


end;

procedure TfrmENReconstrModernOZEdit.initDFDocSignersGrid(
  setDefaultSigners: Boolean);
begin
  tsDFDoc.TabVisible := false;

  if DialogState = dsInsert then Exit;

  DisableActions([actClearDFDocSigners, actSaveDFDocSigners], DialogState = dsView);

  if ENReconstrModernOZObj = nil then Exit;

  if DMReports.isSignable(ENReconstrModernOZObj) then
  begin
    tsDFDoc.TabVisible := true;
    DMReports.setComponentPropsForDFDocsTab(Self, sgDFDocs, sgDFDocSigners);

    // При добавлении не будем отображать
    if (DialogState = dsInsert) then
      //initDFDocSignersGrid;
      tsDFDoc.TabVisible := false;

    if (DialogState = dsEdit) or (DialogState = dsView) then
      loadDFDocSigners;
  end;
end;

procedure TfrmENReconstrModernOZEdit.initDFDocsTab;
begin
  tsDFDoc.TabVisible := false;
  DisableActions([actClearDFDocSigners, actSaveDFDocSigners], DialogState = dsView);

  if ENReconstrModernOZObj = nil then Exit;

  if DMReports.isSignable(ENReconstrModernOZObj) then
  begin
    tsDFDoc.TabVisible := true;
    DMReports.setComponentPropsForDFDocsTab(Self, sgDFDocs, sgDFDocSigners);

    // При добавлении акта не будем отображать
    if (DialogState = dsInsert) then
      //initDFDocSignersGrid;
      tsDFDoc.TabVisible := false;

    if (DialogState = dsEdit) or (DialogState = dsView) then
      loadDFDocSigners;
  end;
end;

procedure TfrmENReconstrModernOZEdit.loadDFDocSigners;
begin
  DMReports.loadDFDocSigners(ENReconstrModernOZObj, Self, sgDFDocSigners);
end;

// договорная стоимость по оз
function  TfrmENReconstrModernOZEdit.getcontractpriceByOZ(codeOz : integer):Double;
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  OZObj : ENReconstrModernOZ;
begin

  TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
  OZObj :=  TempENReconstrModernOZ.getObject(codeOz);
   if ( OZObj.contractPrice <> nil ) then
   if ( OZObj.contractPrice.decimalString <> '0' ) then
     result := StrToFloat( OZObj.contractPrice.decimalString)
   else
     Result := 0;

  edtContractPrice.Text := FloatToStr(Result); // OZObj.contractPrice.decimalString;// FloatToStr(getcontractpriceByOZ(ENReconstrModernOZObj.code));

end;

function TfrmENReconstrModernOZEdit.getDFDocSignersForSaving(
  var dfDocSigners: ArrayOfDFDocSigner): Boolean;
begin
  Result := DMReports.getDFDocSignersForSaving(ENReconstrModernOZObj, Self, sgDFDocSigners, dfDocSigners);
end;

procedure TfrmENReconstrModernOZEdit.spbOSIstClick(Sender: TObject);
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
procedure TfrmENReconstrModernOZEdit.spbOSIstClearClick(Sender: TObject);
begin
   ClearControls([edtOSIstCode, edtOSIst]);
end;

procedure TfrmENReconstrModernOZEdit.updateDFDocs;
begin
  if DialogState = dsInsert then Exit;
  if ENReconstrModernOZObj = nil then Exit;
  if ENReconstrModernOZObj.code = LOW_INT then Exit;

  DMReports.fillDFDocsGrid(ENReconstrModernOZObj, Self, sgDFDocs);
end;

procedure TfrmENReconstrModernOZEdit.updateOSDataTab;
var
  TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
  osDataFilter: ENReconstrModern2OSDataFilter;
  osDataList: ENReconstrModern2OSDataShortList;
begin

  DenyBlankValues([edtSum_dovvod_nds_b , edtSum_dovvod_b , edtSum_nds , edtName_dovvod , edtKod_nakl , edtDt_nakl , edtOSIstCode , edtOSIst]);

  OSData := nil;

  osDataFilter := ENReconstrModern2OSDataFilter.Create;
  SetNullIntProps(osDataFilter);
  SetNullXSProps(osDataFilter);

  osDataFilter.ENReconstrModernOZRef := ENReconstrModernOZRef.Create;
  osDataFilter.ENReconstrModernOZRef.code :=   ENReconstrModernOZObj.code;

  TempENReconstrModern2OSData := HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;

  osDataList := TempENReconstrModern2OSData.getScrollableFilteredList(osDataFilter, 0, -1);
  if osDataList.totalCount > 0 then
  begin
    if osDataList.list[0] <> nil then
      if osDataList.list[0].code > LOW_INT then
        OSData := TempENReconstrModern2OSData.getObject(osDataList.list[0].code);
  end
  else
    OSData := nil;

   if OSData = nil then
    begin
       // значения по умолчанию
      edtOSIstCode.text := '08';
      edtOSIst.text := 'ДОВВОД ПО РЕКОНСТР, МОДЕРНИЗАЦ С 01.01.2012';
       // наименование доввода по умолчанию
      if ENReconstrModernOZObj.typeRM = 1 then
      edtName_dovvod.Text :=  'РЕКОНСТРУКЦІЯ' + ' АКТ № : ' +  upperCase( ENReconstrModernOZObj.numbergen) + ' ВІД ' +   datetostr(EncodeDate(ENReconstrModernOZObj.dateGen.Year,ENReconstrModernOZObj.dateGen.Month,ENReconstrModernOZObj.dateGen.Day));

      if ENReconstrModernOZObj.typeRM = 2 then
      edtName_dovvod.Text :=  'МОДЕРНІЗАЦІЯ' + ' АКТ № : ' +  upperCase( ENReconstrModernOZObj.numbergen) + ' ВІД ' +   datetostr(EncodeDate(ENReconstrModernOZObj.dateGen.Year,ENReconstrModernOZObj.dateGen.Month,ENReconstrModernOZObj.dateGen.Day));

      edtKod_nakl.Text := ENReconstrModernOZObj.numbergen;
      edtDt_nakl.DateTime:=EncodeDate(ENReconstrModernOZObj.dateGen.Year,ENReconstrModernOZObj.dateGen.Month,ENReconstrModernOZObj.dateGen.Day);
      edtDt_nakl.checked := true;
    end
   else
     if OSData.code > LOW_INT then
     // вставка сохраненных данных  из объекта .
     begin

        if OSData.sum_dovvod_n <> nil then
        edtSum_dovvod_n.Text := OSData.sum_dovvod_n.DecimalString
        else
        edtSum_dovvod_n.Text := '';

         if OSData.sum_dovvod_izn_n <> nil then
        edtSum_dovvod_izn_n.Text := OSData.sum_dovvod_izn_n.DecimalString
        else
        edtSum_dovvod_izn_n.Text := '';

        if OSData.sum_dovvod_nds_b <> nil then
        edtSum_dovvod_nds_b.Text := OSData.sum_dovvod_nds_b.DecimalString
        else
        edtSum_dovvod_nds_b.Text := '';

        if OSData.Sum_dovvod_b <> nil then
        edtSum_dovvod_b.Text := OSData.sum_dovvod_b.DecimalString
        else
        edtSum_dovvod_b.Text := '';

        if OSData.sum_nds <> nil then
        edtSum_nds.Text := OSData.sum_nds.DecimalString
        else
        edtSum_nds.Text := '';

        edtName_dovvod.Text := OSData.name_dovvod;

        edtKod_nakl.Text :=  ENReconstrModernOZObj.numbergen ;

        edtOSIstCode.Text := OSData.kod_ist ;
        edtOSIst.Text :=  OSData.name_ist;
        edtKod_nal_nakl.Text := OSData.kod_nal_nakl;
        edtKod_postav.Text := OSData.kod_postav;
        edtKod_dogovor.Text := osData.kod_dogovor;
        edtName_postav.Text := ENReconstrModernOZObj.partnerName;
        if (ENReconstrModernOZObj.finContractDate <> nil) then
        edtDate_dogovor.DateTime:=EncodeDate(ENReconstrModernOZObj.finContractDate.Year,ENReconstrModernOZObj.finContractDate.Month,ENReconstrModernOZObj.finContractDate.Day)
        else
        begin
        edtDate_dogovor.DateTime:= Now;
        edtDate_dogovor.Checked := false;
        end;

        edtDt_nakl.DateTime:=EncodeDate(ENReconstrModernOZObj.dateGen.Year,ENReconstrModernOZObj.dateGen.Month,ENReconstrModernOZObj.dateGen.Day);
        edtDt_nakl.checked := true;

        if OSData.sum_dovvod_izn_b <> nil then
        edtsum_dovvod_izn_b.Text := OSData.sum_dovvod_izn_b.DecimalString
        else
        edtSum_dovvod_izn_b.Text := '';



     end;




end;

procedure TfrmENReconstrModernOZEdit.btnOSDataEditClick(Sender: TObject);
var
  ENServicesObjectList: ENServicesObjectShortList;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  contractFilter : ENServicesObjectFilter;
begin
  inherited;
   LockUnlockOSData(false);
    DisableControls([edtSum_dovvod_nds_b , edtSum_dovvod_b ]);
   // если бух данные не сохрарнены тогда проставим данные по сумме доввода стоимости и ндс БУх.
   if OSData = nil then
    begin


       edtSum_dovvod_izn_n.Text := '0';


       edtSum_dovvod_n.Text := '0';

       if ( ENReconstrModernOZObj.summaGen <> nil ) then
       edtSum_dovvod_b.Text := ENReconstrModernOZObj.summaGen.decimalString
      else
       edtSum_dovvod_b.Text := '0';

      if ( ENReconstrModernOZObj.summaNDS <> nil ) then
       edtSum_nds.Text := ENReconstrModernOZObj.summaNDS.decimalString
      else
       edtSum_nds.Text := '0';

      if  ( (ENReconstrModernOZObj.summaGen <> nil) and (ENReconstrModernOZObj.summaNDS <> nil) ) then
       edtSum_dovvod_nds_b.Text := FloatToStr( StrToFloat(ENReconstrModernOZObj.summaGen.decimalString)
       //+ StrToFloat(ENReconstrModernOZObj.summaNDS.decimalString)
       )
      else if  ( (ENReconstrModernOZObj.summaGen <> nil) and (ENReconstrModernOZObj.summaNDS = nil) ) then
       edtSum_dovvod_nds_b.Text := ENReconstrModernOZObj.summaGen.decimalString
      else
       edtSum_dovvod_nds_b.Text := '0';

      edtKod_postav.Text := ENReconstrModernOZObj.partnerCode;
      edtName_postav.Text := ENReconstrModernOZObj.partnerName;

      /// SUPP-91638 в этом месте нужен код договора из модуля Справочники Фин.коллекции
      /// но в актах реконструкции и амортизации сохраняется только номер и дата договора.
      /// Поэтому будет осуществлена попытка вытащить из финколлекции код договора по номеру
      ///  и коду партнера, а если по заданным критериям поиск не вернет значение
      ///, то по старой логике передадим номер договора.
      ///
      if (ENReconstrModernOZObj.partnerCode <> '') or (ENReconstrModernOZObj.finContractNumber <> '') then
      begin
        TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
        contractFilter := ENServicesObjectFilter.Create;
        SetNullXSProps(contractFilter);
        SetNullIntProps(contractFilter);
        contractFilter.partnerCode := ENReconstrModernOZObj.partnerCode;
        contractFilter.contractNumber := ENReconstrModernOZObj.finContractNumber;
        contractFilter.conditionSQL := 'a.io_flag = ''B''';

        ENServicesObjectList := TempENServicesObject.getContractList(contractFilter,0, -1);

        if ENServicesObjectList.totalCount <> 1 then
        begin
          edtKod_dogovor.Text := ENReconstrModernOZObj.finContractNumber;
        end else
        begin
          edtKod_dogovor.Text := ENServicesObjectList.list[0].finDocCode;
        end;
      end else
        edtKod_dogovor.Text := ENReconstrModernOZObj.finContractNumber;

      if ENReconstrModernOZObj.finContractDate <> nil then
      edtDate_dogovor.DateTime:=EncodeDate(ENReconstrModernOZObj.finContractDate.Year,ENReconstrModernOZObj.finContractDate.Month,ENReconstrModernOZObj.finContractDate.Day);

    end;

end;


procedure TfrmENReconstrModernOZEdit.LockUnlockOSData(lock: Boolean);
begin
  // Если ордер не в статусе "Складений", ничего не разлочиваем !!!
  if statusCode <> ENRECONSTRMODERNIZACSTATUS_SEGNED then
  begin
    DisableControls([edtSum_dovvod_n , edtSum_dovvod_izn_n  , edtSum_dovvod_nds_b , edtSum_dovvod_b   , edtSum_dovvod_izn_b  , edtSum_nds  ,
                     edtName_dovvod     , edtKod_nal_nakl ,  spbOSIst  , spbOSIstClear ]);

    DisableControls([btnOSDataEdit, btnOSDataSave, btnOSDataCancel]);

    Exit;
  end;

  DisableControls([edtSum_dovvod_n , edtSum_dovvod_izn_n  , edtSum_dovvod_nds_b , edtSum_dovvod_b   , edtSum_dovvod_izn_b  , edtSum_nds  ,
                     edtName_dovvod    , edtKod_nal_nakl , edtKod_postav , edtKod_dogovor , spbOSIst  , spbOSIstClear ], lock);

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

  DisableControls([edtKod_postav , edtKod_dogovor  , edtName_postav , edtDate_dogovor  , edtKod_nakl , edtDt_nakl , edtOSIst  , edtOSIstCode ]);
end;

procedure TfrmENReconstrModernOZEdit.btnOSDataSaveClick(Sender: TObject);

var TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
    newOSDataCode: Integer;
begin
  try
  if not NoBlankValues([edtSum_dovvod_nds_b, edtSum_dovvod_b, edtName_dovvod,edtKod_nakl , edtOSIstCode , edtDt_nakl , edtSum_nds]) then
  begin
    Application.MessageBox(PChar('Заповніть, будь ласка, обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING);
    AllowClose := false;
    Exit;
  end;

  TempENReconstrModern2OSData := HTTPRIOENReconstrModern2OSData as ENReconstrModern2OSDataControllerSoapPort;

  if OSData = nil then
  begin
    OSData := ENReconstrModern2OSData.Create;
    SetNullIntProps(OSData);
    SetNullXSProps(OSData);

    OSData.ENReconstrModernOZRef := ENReconstrModernOZRef.Create;
    OSData.ENReconstrModernOZRef.code :=  ENReconstrModernOZObj.code;
  end
  else begin
    if OSData.code > LOW_INT then
      OSData := TempENReconstrModern2OSData.getObject(OSData.code)
    else
      raise Exception.Create('Помилка під час вибору бух. даних для ОЗ!');
  end;

  if edtSum_dovvod_n.Text <> '' then
  begin
    if OSData.sum_dovvod_n = nil then
      OSData.sum_dovvod_n := TXSDecimal.Create;
    OSData.sum_dovvod_n.DecimalString := edtSum_dovvod_n.Text;
  end
  else
    OSData.sum_dovvod_n := nil;

    if edtSum_dovvod_izn_n.Text <> '' then
  begin
    if OSData.sum_dovvod_izn_n = nil then
      OSData.sum_dovvod_izn_n := TXSDecimal.Create;
    OSData.sum_dovvod_izn_n.DecimalString := edtSum_dovvod_izn_n.Text;
  end
  else
    OSData.sum_dovvod_izn_n := nil;

  if edtSum_dovvod_nds_b.Text <> '' then
  begin
    if OSData.Sum_dovvod_nds_b = nil then
      OSData.Sum_dovvod_nds_b := TXSDecimal.Create;
    OSData.Sum_dovvod_nds_b.DecimalString := edtSum_dovvod_nds_b.Text;
  end
  else
    OSData.Sum_dovvod_nds_b := nil;

     if edtSum_dovvod_b.Text <> '' then
  begin
    if OSData.Sum_dovvod_b = nil then
      OSData.Sum_dovvod_b := TXSDecimal.Create;
    OSData.Sum_dovvod_b.DecimalString := edtSum_dovvod_b.Text;
  end
  else
    OSData.Sum_dovvod_b := nil;

  if edtSum_nds.Text <> '' then
  begin
    if OSData.Sum_nds = nil then
      OSData.Sum_nds := TXSDecimal.Create;
    OSData.Sum_nds.DecimalString := edtSum_nds.Text;
  end
  else
    OSData.Sum_nds := nil;

  if edtSum_dovvod_izn_b.Text <> '' then
  begin
    if OSData.Sum_dovvod_izn_b = nil then
      OSData.Sum_dovvod_izn_b := TXSDecimal.Create;
    OSData.Sum_dovvod_izn_b.DecimalString := edtSum_dovvod_izn_b.Text;
  end
  else
    OSData.Sum_dovvod_izn_b := nil;

  OSData.name_dovvod := UpperCase(edtName_dovvod.Text);
  OSData.kod_nakl := edtKod_nakl.Text;
  if edtdt_nakl.checked then
     begin
       if OSData.dt_nakl = nil then
          OSData.dt_nakl := TXSDateTime.Create;
       OSData.dt_nakl.XSToNative(GetXSDate(edtdt_nakl.DateTime));
     end
     else
       OSData.dt_nakl := nil;
  OSData.kod_nal_nakl := edtKod_nal_nakl.Text;

  OSData.kod_ist := edtOSIstCode.Text;
  OSData.name_ist := edtOSIst.Text;

  OSData.kod_postav := edtKod_postav.Text;
  OSData.kod_dogovor := edtKod_dogovor.Text;

  OSData.kod_inv := ENReconstrModernOZObj.invNumberOZ;



  // Добавляем (или сохраняем, если уже есть) связку
  if OSData.code = LOW_INT then
  begin
    newOSDataCode := TempENReconstrModern2OSData.add(OSData);
  end
  else begin
    TempENReconstrModern2OSData.save(OSData);

  end;

  Application.MessageBox(PChar('Дані збережено!'), PChar('Інформація'), MB_ICONINFORMATION);
  AllowClose := true;
  updateOSDataTab();
  LockUnlockOSData();
  except

//     raise Exception.Create('Помилка під час збереження бух. даних для ОЗ!');
    // on EConvertError do OSData := nil;
    // E: Exception do ErrorDialog(E.Message, E.HelpContext);
   on E: Exception do
   begin
     OSData := nil;
     ShowMessage (E.Message);
   end;

  end;
end;

procedure TfrmENReconstrModernOZEdit.pgc1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
   // Если начали редактировать, но не сохранили
  if btnOSDataSave.Enabled then
  begin
    if Application.MessageBox(PChar('Зберегти зміни у бух. даних для ОЗ ?'),
                              PChar('Увага !'),
                              MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES then
    begin
      btnOSDataSaveClick(Sender);
      AllowChange := AllowClose;
    end
    else
      btnOSDataCancelClick(Sender);
  end;

end;

procedure TfrmENReconstrModernOZEdit.btnOSDataCancelClick(Sender: TObject);
begin
  updateOSDataTab();
  LockUnlockOSData();

end;

procedure TfrmENReconstrModernOZEdit.btnPrintOrderClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;


  TempENAct: ENActControllerSoapPort;
  actFilter: ENActFilter;
  actDate: String;
  LastCount  , i : integer;

   TempRMOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
   RMOZ2ENactFilter : ENReconstrModernOZ2ENactFilter;
   RMOZ2ENactList : ENReconstrModernOZ2ENactShortList;
	 isPrint  : Boolean;


	 Tempenactproj2oz2date : enactproj2oz2dateControllerSoapPort;

	 ap2oz2dateFilter : ENActProj2OZ2DateFilter;
	 ap2oz2dateList : enactproj2oz2dateShortList;
begin
  if DialogState = dsInsert then Exit;

  if DMReports.getDocCodeForObject(ENReconstrModernOZObj) > 0 then
    if DMReports.printReportsForObject(ENReconstrModernOZObj) then Exit;

  isPrint := False;
	TempRMOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
	Tempenactproj2oz2date := HTTPRIOENActProj2OZ2Date as enactproj2oz2dateControllerSoapPort;

    RMOZ2ENactFilter := ENReconstrModernOZ2ENactFilter.Create;
    SetNullIntProps(RMOZ2ENactFilter);
    SetNullXSProps(RMOZ2ENactFilter);

    RMOZ2ENactFilter.ENReconstrModernOZRef:= ENReconstrModernOZRef.Create;
		RMOZ2ENactFilter.ENReconstrModernOZRef.code := ENReconstrModernOZObj.code;
		//
		ap2oz2dateFilter := ENActProj2OZ2DateFilter.Create;
		SetNullIntProps(ap2oz2dateFilter);
		SetNullXSProps(ap2oz2dateFilter);

		ap2oz2dateFilter.conditionSQL :=   ' enactproj2oz2date.code in  (Select enactproj2oz2date.code from enactproj2oz2date  , enactproj2oz2 '+
																			 '	where enactproj2oz2date.enactprojrefcode = enactproj2oz2.code '+
																			 '	and enactproj2oz2.enreconstrmodernozrfcd = '+ IntToStr(ENReconstrModernOZObj.code) + ')' ;


		RMOZ2ENactList := TempRMOZ2ENact.getScrollableFilteredListForRM(RMOZ2ENactFilter, 0, -1);
		ap2oz2dateList := Tempenactproj2oz2date.getScrollableFilteredList(ap2oz2dateFilter, 0, -1);

		LastCount := High(RMOZ2ENactList.list);

      for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
         if  RMOZ2ENactList.list[i].isCalculationDate = 1 then
          begin
           isPrint := True;
           Break;
          end;
      end;

       SetLength(argNames, 1);
       SetLength(args, 1);
       argnames[0] := 'ozCode';
       args[0] := IntToStr( ENReconstrModernOZObj.code );
       reportName := 'OS_T/OZ-2';
			 if( (isPrint)  or (ap2oz2dateList.totalCount > 0 )) then
       makeReport(reportName, argNames, args, 'xls')
       else
       begin
         Application.MessageBox(PChar('Помилка при формуванні ОЗ_2. По всім актам які включено до ОЗ_2 відсутній признак "Урахування дат по наряд завданням" !!!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
        
       end;


end;

procedure TfrmENReconstrModernOZEdit.chkisInvestProgramClick(
  Sender: TObject);
begin
  inherited;

  if chkisInvestProgram.Checked then
   begin
     DisableControls([edtYearInvestProgram , spbInvestProgramGroups , edtItemInvestProgram],false );
   end
  else
   begin
      DisableControls([edtYearInvestProgram , spbInvestProgramGroups , edtItemInvestProgram] );
      edtYearInvestProgram.Text := '';
      edtItemInvestProgram.Text := '';
      edtInvestProgramGroupsName.Text := '';
      if ENReconstrModernOZObj.invgroupRef <> nil then 
         ENReconstrModernOZObj.invgroupRef.code := LOW_INT;

   end;

end;

procedure TfrmENReconstrModernOZEdit.spbInvestProgramGroupsClick(
  Sender: TObject);
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
               if ENReconstrModernOZObj.invgroupRef = nil then ENReconstrModernOZObj.invgroupRef := ENInvestProgramGroupsRef.Create();
               ENReconstrModernOZObj.invgroupRef.code := StrToInt(GetReturnValue(sgENInvestProgramGroups,0));
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

procedure TfrmENReconstrModernOZEdit.actUpdateGridActProjectExecute(
  Sender: TObject);
var
  TempENActProj2OZ2: ENActProj2OZ2ControllerSoapPort;
  ActProj2OZ2Filter: ENActProj2OZ2Filter;
  ENActProj2OZ2List: ENActProj2OZ2ShortList;
  LastCount  , ColCount, i : integer;

  // sum : Double;
begin
   ClearGrid(sgENActProj2OZ2);

   TempENActProj2OZ2 :=  HTTPRIOENActProj2OZ2 as ENActProj2OZ2ControllerSoapPort;

    ActProj2OZ2Filter := ENActProj2OZ2Filter.Create;
    SetNullIntProps(ActProj2OZ2Filter);
    SetNullXSProps(ActProj2OZ2Filter);

    ActProj2OZ2Filter.ENReconstrModernOZRef:= ENReconstrModernOZRef.Create;
    ActProj2OZ2Filter.ENReconstrModernOZRef.code := ENReconstrModernOZObj.code;

    ENActProj2OZ2List := TempENActProj2OZ2.getScrollableFilteredList(ActProj2OZ2Filter, 0, -1);

      LastCount := High(ENActProj2OZ2List.list);
     // sum := 0;

    if LastCount > -1 then
       sgENActProj2OZ2.RowCount:=LastCount+2
    else
       sgENActProj2OZ2.RowCount:=2;

   with sgENActProj2OZ2 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActProj2OZ2List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActProj2OZ2List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActProj2OZ2List.list[i].numberGen;
        if ENActProj2OZ2List.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActProj2OZ2List.list[i].dateGen);
        if ENActProj2OZ2List.list[i].summaGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENActProj2OZ2List.list[i].summaGen.DecimalString;

         if ( ENActProj2OZ2List.list[i].summaGen <> nil ) then
          sum := sum +  StrToFloat(ENActProj2OZ2List.list[i].summaGen.DecimalString);

      // Cells[4,i+1] := ENActProj2OZ2List.list[i]
//        if ENActProj2OZ2List.list[i].dateEdit = nil then
//          Cells[5,i+1] := ''
//        else
//          Cells[5,i+1] := XSDate2String(ENActProj2OZ2List.list[i].dateEdit);
        LastRow:=i+1;
        sgENActProj2OZ2.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActProj2OZ2.Row:=1;

   actUpdateGridDateForActProjectExecute(Sender); 

end;

procedure TfrmENReconstrModernOZEdit.actInsertDateForActProjectExecute(
  Sender: TObject);
begin
  inherited;
   // TempENActProj2OZ2Date := HTTPRIOENActProj2OZ2Date as ENActProj2OZ2DateControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActProj2OZ2DateObj:=ENActProj2OZ2Date.Create;

  if sgENActProj2OZ2.Cells[0,sgENActProj2OZ2.Row] = '' then
  begin
    Application.MessageBox(PChar('Спочатку треба додати акт по проектуванню !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    // Action:=caNone;
    exit;
  end;


  ENActProj2OZ2DateObj.ENActProjRef := ENActProj2OZ2Ref.Create;
  ENActProj2OZ2DateObj.ENActProjRef.code := StrToInt(sgENActProj2OZ2.Cells[0,sgENActProj2OZ2.Row]);

   //ENActProj2OZ2DateObj.dateGen:= TXSDate.Create;


  try
    frmENActProj2OZ2DateEdit:=TfrmENActProj2OZ2DateEdit.Create(Application, dsInsert);
    try
      if frmENActProj2OZ2DateEdit.ShowModal = mrOk then
      begin
        if ENActProj2OZ2DateObj<>nil then
            //TempENActProj2OZ2Date.add(ENActProj2OZ2DateObj);
            actUpdateGridDateForActProjectExecute(Sender);
      end;
    finally
      frmENActProj2OZ2DateEdit.Free;
      frmENActProj2OZ2DateEdit:=nil;
    end;
  finally
    ENActProj2OZ2DateObj.Free;
  end;
end;

procedure TfrmENReconstrModernOZEdit.actUpdateGridDateForActProjectExecute(
  Sender: TObject);
var
  TempENActProj2OZ2Date: ENActProj2OZ2DateControllerSoapPort;
  i , ColCount , LastCount: Integer;
  ENActProj2OZ2DateList: ENActProj2OZ2DateShortList;
  ActProj2OZ2DateFilter : ENActProj2OZ2DateFilter;

  begin
  ClearGrid(sgENActProj2OZ2Date);

  SetGridHeaders(ENActProj2OZ2DateHeaders, sgENActProj2OZ2Date.ColumnHeaders);

  ColCount:=100;
  TempENActProj2OZ2Date :=  HTTPRIOENActProj2OZ2Date as ENActProj2OZ2DateControllerSoapPort;
   ActProj2OZ2DateFilter := nil;
  if ActProj2OZ2DateFilter = nil then
  begin
     ActProj2OZ2DateFilter := ENActProj2OZ2DateFilter.Create;
     SetNullIntProps(ActProj2OZ2DateFilter);
     SetNullXSProps(ActProj2OZ2DateFilter);
  end;

  if sgENActProj2OZ2.Cells[0,sgENActProj2OZ2.Row] <> '' then
  begin
    // ActProj2OZ2DateFilter.ENActProjRef  := ENActProj2OZ2Ref.Create;
    // ActProj2OZ2DateFilter.ENActProjRef.code :=  StrToInt(sgENActProj2OZ2.Cells[0,sgENActProj2OZ2.Row]);

    ActProj2OZ2DateFilter.conditionSQL := ' ENACTPROJ2OZ2.CODE = ' + sgENActProj2OZ2.Cells[0,sgENActProj2OZ2.Row];

    ENActProj2OZ2DateList := TempENActProj2OZ2Date.getScrollableFilteredList(ENActProj2OZ2DateFilter(ActProj2OZ2DateFilter),0,ColCount);


    LastCount:=High(ENActProj2OZ2DateList.list);

    if LastCount > -1 then
       sgENActProj2OZ2Date.RowCount:=LastCount+2
    else
       sgENActProj2OZ2Date.RowCount:=2;

     with sgENActProj2OZ2Date do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENActProj2OZ2DateList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENActProj2OZ2DateList.list[i].code)
          else
          Cells[0,i+1] := '';
          if ENActProj2OZ2DateList.list[i].dateGen = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := XSDate2String(ENActProj2OZ2DateList.list[i].dateGen);
          LastRow:=i+1;
          sgENActProj2OZ2Date.RowCount:=LastRow+1;
        end;
     ColCount:=ColCount+1;
     sgENActProj2OZ2Date.Row:=1;
  end; 
end;

procedure TfrmENReconstrModernOZEdit.actClearDFDocSignersExecute(
  Sender: TObject);
begin
  if DialogState = dsView then Exit;

  initDFDocSignersGrid(false);
end;

procedure TfrmENReconstrModernOZEdit.actDeleteDateForActProjectExecute(
  Sender: TObject);
Var TempENActProj2OZ2Date: ENActProj2OZ2DateControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActProj2OZ2Date := HTTPRIOENActProj2OZ2Date as ENActProj2OZ2DateControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActProj2OZ2Date.Cells[0,sgENActProj2OZ2Date.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Період виконання робіт по проектуванню) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActProj2OZ2Date.remove(ObjCode);
      actUpdateGridDateForActProjectExecute(Sender);
  end;
end;

procedure TfrmENReconstrModernOZEdit.sgENActProj2OZ2Click(Sender: TObject);
begin
  inherited;
   // inherited;
   actUpdateGridDateForActProjectExecute(Sender);
end;

procedure TfrmENReconstrModernOZEdit.actisCalculationDateTrueExecute(
  Sender: TObject);
var TempENReconstrModernOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
    ObjCode : Integer;
    obj : ENReconstrModernOZ2ENact;
begin

begin


    TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
    TempENReconstrModernOZ2ENact.updateIsCalculationDate(StrToInt(sgENAct.Cells[0,sgENAct.Row]) , ENReconstrModernOZObj.code , 1);

    actUpdateGridActExecute(Sender);
    getSummaGenByOZ(ENReconstrModernOZObj.code);
end;

end;

procedure TfrmENReconstrModernOZEdit.actisCalculationDateFalseExecute(
  Sender: TObject);
var TempENReconstrModernOZ2ENact : ENReconstrModernOZ2ENactControllerSoapPort;
    ObjCode : Integer;
    obj : ENReconstrModernOZ2ENact;
begin

begin


    TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
    TempENReconstrModernOZ2ENact.updateIsCalculationDate(StrToInt(sgENAct.Cells[0,sgENAct.Row]) , ENReconstrModernOZObj.code , 0);

    actUpdateGridActExecute(Sender);
    getSummaGenByOZ(ENReconstrModernOZObj.code);
end;

end;

procedure TfrmENReconstrModernOZEdit.PopupMenu2Popup(Sender: TObject);
var
  state : Boolean;
begin
     state := false;
     sgENAct.GetCheckBoxState(7, sgENAct.Row, state);

    if state then
    begin
    DisableActions([ actisCalculationDateTrue]);
    DisableActions([ actisCalculationDateFalse],false);
    end
    else
    begin
    DisableActions([ actisCalculationDateFalse]);
        DisableActions([ actisCalculationDateTrue],false);
    end;


    
end;

function  TfrmENReconstrModernOZEdit.getPartnerCodeByOZ(codeOz : integer):String;
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  OZObj : ENReconstrModernOZ;
begin

  TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
  OZObj :=  TempENReconstrModernOZ.getObject(codeOz);

  if OZObj.partnerCode <> '' then
  result := OZObj.partnerCode
  else
  result := '';

end;


function  TfrmENReconstrModernOZEdit.getPartnerNameByOZ(codeOz : integer):String;
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  OZObj : ENReconstrModernOZ;
begin

  TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
  OZObj :=  TempENReconstrModernOZ.getObject(codeOz);

  if OZObj.partnerName <> '' then
  result := OZObj.partnerName
  else
  result := '';

end;

function  TfrmENReconstrModernOZEdit.getfinContractNumberByOZ(codeOz : integer):String;
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  OZObj : ENReconstrModernOZ;
begin

  TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
  OZObj :=  TempENReconstrModernOZ.getObject(codeOz);

  if OZObj.finContractNumber <> '' then
  result := OZObj.finContractNumber
  else
  result := '';

end;



function  TfrmENReconstrModernOZEdit.getfinContractDateByOZ(codeOz : integer):TdateTime;
var
  TempENReconstrModernOZ: ENReconstrModernOZControllerSoapPort;
  OZObj : ENReconstrModernOZ;
begin

  TempENReconstrModernOZ := HTTPRIOENReconstrModernOZ as ENReconstrModernOZControllerSoapPort;
  OZObj :=  TempENReconstrModernOZ.getObject(codeOz);

  if OZObj.finContractDate <> nil then
  result := EncodeDate(OZObj.finContractDate.Year,OZObj.finContractDate.Month,OZObj.finContractDate.Day)
  else
  result := 0;

end;


end.
