
unit EditENLine150;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENLine150Controller, AdvObj,
    CCElementDataController, CCFeederController, ENPostController, EditENPost,
    ENObjectsTechnicalStatusController,
    IdFTP, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
    IdExplicitTLSClientServerBase, ShellAPI, TB2Item, TB2Dock, TB2Toolbar,
    CCDamageLogController, CCGlobal, CCDMReportUnit, CCReportController;

type
  TfrmENLine150Edit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    pcENLine150: TPageControl;
    tsLine150: TTabSheet;
    edtName: TEdit;
    edtFINExecutorName: TEdit;
    edtExtentForest: TEdit;
    edtChains2Length: TEdit;
    edtEPVoltageNominalName: TEdit;
    edtEPRenName: TEdit;
    edtDateGen: TDateTimePicker;
    edtLastRepairDate: TDateTimePicker;
    edtChainsLength: TEdit;
    edtMoreData: TMemo;
    edtNameBuilder: TEdit;
    edtNameProject: TEdit;
    edtYearWorkingStart: TEdit;
    edtYearBuild: TEdit;
    edtLineLength: TEdit;
    edtBuhName: TEdit;
    edtInvNumber: TEdit;
    lblExecuter: TLabel;
    spbFINExecutor: TSpeedButton;
    lblExtentForest: TLabel;
    spbOSSelect: TSpeedButton;
    lblChains2Length: TLabel;
    lblEPVoltageNominalName: TLabel;
    spbEPVoltageNominal: TSpeedButton;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    lblDateGen: TLabel;
    lblLastRepairDate: TLabel;
    lblChainsLength: TLabel;
    lblMoreData: TLabel;
    lblNameBuilder: TLabel;
    lblNameProject: TLabel;
    lblYearWorkingStart: TLabel;
    lblYearBuild: TLabel;
    lblLineLength: TLabel;
    lblBuhName: TLabel;
    lblName: TLabel;
    lblInvNumber: TLabel;
    tsCCElement: TTabSheet;
    sgCCElementData: TAdvStringGrid;
    HTTPRIOCCElementData: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENLine150: THTTPRIO;
    HTTPRIOCCFeeder: THTTPRIO;
    tsPost35_150: TTabSheet;
    ImageList1: TImageList;
    ActionListPost: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    actViewStand: TAction;
    actInsertStand: TAction;
    actDeleteStand: TAction;
    actEditStand: TAction;
    actUpdateStand: TAction;
    actFilterStand: TAction;
    actNoFilterStand: TAction;
    actViewTravers: TAction;
    actInsertTravers: TAction;
    actDeleteTravers: TAction;
    actEditTravers: TAction;
    actUpdateTravers: TAction;
    actFilterTravers: TAction;
    actNoFilterTravers: TAction;
    actViewHook: TAction;
    actInsertHook: TAction;
    actDeleteHook: TAction;
    actEditHook: TAction;
    actUpdateHook: TAction;
    actFilterHook: TAction;
    actNoFilterHook: TAction;
    actViewInsulator: TAction;
    actInsertInsulator: TAction;
    actDeleteInsulator: TAction;
    actEditInsulator: TAction;
    actUpdateInsulator: TAction;
    actFilterInsulator: TAction;
    actNoFilterInsulator: TAction;
    actChangeInsulator: TAction;
    actUninstallInsulator: TAction;
    actInstallInsulator: TAction;
    actViewDisconnector: TAction;
    actInsertDisconnector: TAction;
    actDeleteDisconnector: TAction;
    actEditDisconnector: TAction;
    actUpdateDisconnector: TAction;
    actFilterDisconnector: TAction;
    actNoFilterDisconnector: TAction;
    actChangeDisconnector: TAction;
    actUninstallDisconnector: TAction;
    actInstallDisconnector: TAction;
    actViewBranch10Post: TAction;
    actInsertBranch10Post: TAction;
    actDeleteBranch10Post: TAction;
    actEditBranch10Post: TAction;
    actUpdateBranch10Post: TAction;
    actFilterBranch10Post: TAction;
    actNoFilterBranch10Post: TAction;
    actViewBranch10Disconnector: TAction;
    actInsertBranch10Disconnector: TAction;
    actDeleteBranch10Disconnector: TAction;
    actEditBranch10Disconnector: TAction;
    actUpdateBranch10Disconnector: TAction;
    actFilterBranch10Disconnector: TAction;
    actNoFilterBranch10Disconnector: TAction;
    actViewBranch10Insulator: TAction;
    actInsertBranch10Insulator: TAction;
    actDeleteBranch10Insulator: TAction;
    actEditBranch10Insulator: TAction;
    actUpdateBranch10Insulator: TAction;
    actFilterBranch10Insulator: TAction;
    actNoFilterBranch10Insulator: TAction;
    actViewBranch10Hook: TAction;
    actInsertBranch10Hook: TAction;
    actDeleteBranch10Hook: TAction;
    actEditBranch10Hook: TAction;
    actUpdateBranch10Hook: TAction;
    actFilterBranch10Hook: TAction;
    actNoFilterBranch10Hook: TAction;
    actViewBranch10Travers: TAction;
    actInsertBranch10Travers: TAction;
    actDeleteBranch10Travers: TAction;
    actEditBranch10Travers: TAction;
    actUpdateBranch10Travers: TAction;
    actFilterBranch10Travers: TAction;
    actNoFilterBranch10Travers: TAction;
    actViewBranch10Stand: TAction;
    actInsertBranch10Stand: TAction;
    actDeleteBranch10Stand: TAction;
    actEditBranch10Stand: TAction;
    actUpdateBranch10Stand: TAction;
    actFilterBranch10Stand: TAction;
    actNoFilterBranch10Stand: TAction;
    actSelectPost: TAction;
    actUnlinkPost: TAction;
    actPassportLine10: TAction;
    actViewP4O: TAction;
    actInsertP4O: TAction;
    actDeleteP4O: TAction;
    actEditP4O: TAction;
    actUpdateP4O: TAction;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENPost: TAdvStringGrid;
    HTTPRIOENPost: THTTPRIO;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;
    tsAttachments: TTabSheet;
    sgENDocAttachment: TAdvStringGrid;
    ToolBar19: TToolBar;
    btnLoadAttachment: TToolButton;
    btnAddAttachments: TToolButton;
    btnDeleteAttachment: TToolButton;
    btnUpdateAttachments: TToolButton;
    ActionAttachment: TActionList;
    actLoadAttachment: TAction;
    actAddAttachment: TAction;
    actDeleteAttachment: TAction;
    actUpdateAttachments: TAction;
    pmAttachment: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    HTTPRIOENDocAttachment: THTTPRIO;
    tsENInspectionSheet: TTabSheet;
    alInspectionSheet: TActionList;
    actViewInspectionSheet: TAction;
    actInsertENInspectionSheet: TAction;
    actDeleteENInspectionSheet: TAction;
    actEditENInspectionSheet: TAction;
    actUpdateENInspectionSheet: TAction;
    actSendToSigning: TAction;
    actUnSigning: TAction;
    actSigned: TAction;
    actUnSigned: TAction;
    actCopySheet: TAction;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    sgENInspectionSheet: TAdvStringGrid;
    HTTPRIOENInspectionSheet: THTTPRIO;
    pmInspectionSheet: TPopupMenu;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    miSendToSigning: TMenuItem;
    miUnSigning: TMenuItem;
    miSigned: TMenuItem;
    miUnSigned: TMenuItem;
    N5: TMenuItem;
    miCopySheet: TMenuItem;
    tsTechnicalStatus: TTabSheet;
    gbMainElements: TGroupBox;
    lblTotalCountMetal: TLabel;
    lblDefectCountMetal: TLabel;
    lblTotalCountArmored: TLabel;
    lblDefectCountArmored: TLabel;
    lblTotalLengthCable: TLabel;
    lblDefectLengthtCable: TLabel;
    lblTotalCountInsulator: TLabel;
    lblDefectCountInsulator: TLabel;
    lblTotalCountTraverse: TLabel;
    lblDefectCountTraverse: TLabel;
    edtTotalCountMetal: TEdit;
    edtDefectCountMetal: TEdit;
    edtTotalCountArmored: TEdit;
    edtDefectCountArmored: TEdit;
    edtTotalLengthCable: TEdit;
    edtDefectLengthtCable: TEdit;
    edtTotalCountInsulator: TEdit;
    edtDefectCountInsulator: TEdit;
    edtTotalCountTraverse: TEdit;
    edtDefectCountTraverse: TEdit;
    lblBaseDistance: TLabel;
    edtBaseDistance: TEdit;
    lblMaxFallPower: TLabel;
    edtMaxFallPower: TEdit;
    lblLengthToReconstruct: TLabel;
    edtLengthToReconstruct: TEdit;
    lblVKD: TLabel;
    edtVKD: TEdit;
    edtVKDO: TEdit;
    lblVKDO: TLabel;
    lblVKDP: TLabel;
    edtVKDP: TEdit;
    lblVKDI: TLabel;
    edtVKDI: TEdit;
    btnEvaluateTechnicalStatus: TButton;
    btnPrint: TButton;
    gbENSettings: TGroupBox;
    sgENSettings: TAdvStringGrid;
    lblVKDA: TLabel;
    edtVKDA: TEdit;
    lblVKDT: TLabel;
    edtVKDT: TEdit;
    lblVKDF: TLabel;
    edtVKDF: TEdit;
    lblTotalCountArmature: TLabel;
    lblTotalLengthGroundWire: TLabel;
    lblTotalCountFooting: TLabel;
    edtTotalCountArmature: TEdit;
    edtTotalLengthGroundWire: TEdit;
    edtTotalCountFooting: TEdit;
    edtDefectCountArmature: TEdit;
    edtDefectLengthGroundWire: TEdit;
    edtDefectCountFooting: TEdit;
    lblDefectCountArmature: TLabel;
    lblDefectLengthGroundWire: TLabel;
    lblDefectCountFooting: TLabel;
    HTTPRIOENSettings: THTTPRIO;
    HTTPRIOENObjectsTechnicalStatus: THTTPRIO;
    tsCCDamageLog: TTabSheet;
    HTTPRIOCCDamageLog: THTTPRIO;
    sgCCDamageLog: TAdvStringGrid;
    spbGetBaseDistance: TSpeedButton;
    tbDamages: TTBToolbar;
    tbiDamagesXLS: TTBItem;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEPRenClick(Sender : TObject);
  procedure spbEPVoltageNominalClick(Sender : TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure LoadCCElement();
    procedure LoadCCDamageLog();
    procedure OpenSLAMO(Sender: TObject);
    procedure sgCCElementDataDblClick(Sender: TObject);
    procedure pcENLine150Change(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
    procedure actAddAttachmentExecute(Sender: TObject);
    procedure actDeleteAttachmentExecute(Sender: TObject);
    procedure actUpdateAttachmentsExecute(Sender: TObject);
    procedure actLoadAttachmentExecute(Sender: TObject);
    procedure sgENInspectionSheetClick(Sender: TObject);
    procedure actInsertENInspectionSheetExecute(Sender: TObject);
    procedure actViewInspectionSheetExecute(Sender: TObject);
    procedure actEditENInspectionSheetExecute(Sender: TObject);
    procedure actDeleteENInspectionSheetExecute(Sender: TObject);
    procedure actUpdateENInspectionSheetExecute(Sender: TObject);
    procedure actSendToSigningExecute(Sender: TObject);
    procedure actUnSigningExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure actCopySheetExecute(Sender: TObject);
    procedure pmInspectionSheetPopup(Sender: TObject);
    procedure btnEvaluateTechnicalStatusClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure sgCCDamageLogDblClick(Sender: TObject);
    procedure spbGetBaseDistanceClick(Sender: TObject);
    procedure tbiDamagesXLSClick(Sender: TObject);

  private
    { Private declarations }
    ENObjectsTechnicalStatusObj: ENObjectsTechnicalStatus;
    procedure updateAttachments();            //Обновление списка вложений
    procedure updateInspectionSheets();
    procedure LoadTechnicalStatus(Sender: TObject);
    procedure getBaseDistance();
  public
    { Public declarations }

end;

var
  frmENLine150Edit: TfrmENLine150Edit;
  ENLine150Obj: ENLine150;

implementation

uses
  ShowENEPRen
  //,EPRenController
  ,ShowEPVoltageNominal
  //,EPVoltageNominalController
  ,ShowENElement
  ,ENElementController
  ,OSTableController
  ,ShowOStable
  ,ShowFINExecutorTree, FINExecutorController, DMReportsUnit, ENConsts
  ,EditCCElementData, EditTopologyF10, EditCCFeeder,
  ENGeographicDepartmentController, ShowENGeographicDepartment,
  ENDocAttachmentController, EditDFDocAttachment,
  ENDocAttachmentServerController, Globals, ENDocAttachmentStatusController,
  ENInspectionSheetController, AddENInspectionSheet, EditENInspectionSheet,
  ENSettingsController, EditCCDamageLog;

{uses  
    EnergyproController, EnergyproController2, ENLine150Controller  ;
}
{$R *.dfm}

var

 pFilterObject: ENPostFilter;                      //Опори
 pColCount, pLastCount: Integer;
 pLastRow: Integer = 1;
 ENPostHeaders: array [1..8] of String =
        ( 'Код'
          ,'Тип опори'
          ,'Заземлення'
          ,'Номер опори'
          ,'Довжина стояка, м'
          ,'Дата останнього ремонту'
          ,'Рік встановлення'
          ,'Примітка'
        );

  ENDocAttachmentHeaders: array [1..7] of String =
       ( 'Код'
         ,'Коментар до вкладення'
         ,'Посилання на файл'
         ,'Користувач, що додав вкладення'
         ,'Дата додавання'
         ,'Користувач, що змінив вкладення'
         ,'Дата зміни'
       );

procedure TfrmENLine150Edit.FormShow(Sender: TObject);
var
    TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
    ENGeographicDepartmentObj : ENGeographicDepartment;

    eList : ENElementShortList;
    TempENElement: ENElementControllerSoapPort;
    eFilter : ENElementFilter;
begin
  pcENLine150.ActivePage:=tsLine150;

  SetGridHeaders(ENInspectionSheetHeaders, sgENInspectionSheet.ColumnHeaders);

  FormatSettings.DecimalSeparator := '.';

////////////////////////////////////////////////////////////////////////////////
  btnEvaluateTechnicalStatus.Visible := (DialogState = dsEdit);
  gbENSettings.Enabled := (DialogState = dsEdit);

  DisableActions([actSendToSigning, actUnSigning, actSigned, actUnSigned]);

  SetIntStyle([edtYearBuild, edtYearWorkingStart]);
  SetFloatStyle([edtLineLength, edtExtentForest, edtTotalLengthCable,
                 edtBaseDistance, edtMaxFallPower, edtLengthToReconstruct,
                 edtTotalLengthGroundWire]);

  SetIntStyle([edtTotalCountArmored, edtTotalCountMetal, edtTotalCountInsulator,
               edtTotalCountTraverse, edtTotalCountArmature, edtTotalCountFooting]);

  DisableControls([edtBuhName
    , edtDefectCountArmored, edtDefectCountMetal, edtDefectLengthtCable
    , edtDefectCountInsulator, edtDefectCountTraverse
    , edtDefectCountArmature, edtDefectLengthGroundWire, edtDefectCountFooting
    , edtVKD, edtVKDO, edtVKDP, edtVKDI
    , edtVKDA, edtVKDT, edtVKDF
    , edtMaxFallPower, edtGeograph]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtEPVoltageNominalName, edtEPRenName]);
    DenyBlankValues([edtName, edtLineLength, edtEPVoltageNominalName, edtEPRenName
      , edtTotalCountArmored, edtTotalCountMetal, edtTotalLengthCable, edtLengthToReconstruct
      , edtTotalCountArmature, edtTotalLengthGroundWire, edtTotalCountFooting
      , edtTotalCountInsulator, edtTotalCountTraverse, edtBaseDistance]);
  end;

  if (DialogState = dsInsert) then
    begin
      showMainTabOnly(pcENLine150, tsLine150);
    end;

  if (DialogState = dsView) then
    begin
      DisableControls([spbEPVoltageNominal, spbEPRen, spbOSSelect, btnGeograph, btnGeographClear]);
      DisableActions([actInsert, actDelete, actEdit,
        actInsertStand, actDeleteStand, actEditStand,
        actInsertTravers, actDeleteTravers, actEditTravers,
        actInsertHook, actDeleteHook, actEditHook,
        actInsertInsulator, actDeleteInsulator, actEditInsulator,
        actChangeInsulator, actUninstallInsulator, actInstallInsulator,
        actInsertDisconnector, actDeleteDisconnector, actEditDisconnector,
        actChangeDisconnector, actUninstallDisconnector, actInstallDisconnector,
        actInsertBranch10Post, actDeleteBranch10Post, actEditBranch10Post,
        actInsertBranch10Disconnector, actDeleteBranch10Disconnector,
          actEditBranch10Disconnector,
        actInsertBranch10Insulator, actDeleteBranch10Insulator,
          actEditBranch10Insulator,
        actInsertBranch10Hook, actDeleteBranch10Hook, actEditBranch10Hook,
        actInsertBranch10Travers, actDeleteBranch10Travers,
          actEditBranch10Travers,
        actInsertBranch10Stand, actDeleteBranch10Stand, actEditBranch10Stand,
        actSelectPost, actUnlinkPost,
        actPassportLine10]);
      HideControls([spbGetBaseDistance]);
    end;

    LoadTechnicalStatus(Sender);
////////////////////////////////////////////////////////////////////////////////


  if  (DialogState = dsView) then
  begin
      DisableControls([spbEPVoltageNominal, spbEPRen, spbOSSelect , btnGeograph , btnGeographClear ]);
  end;

  DisableControls([edtBuhName ,edtGeograph ]);
  
  SetFloatStyle([edtLineLength, edtChainsLength, edtChains2Length]);
  SetIntStyle([edtYearBuild, edtYearWorkingStart ]);

  DisableActions([actSendToSigning, actUnSigning, actSigned, actUnSigned]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtEPVoltageNominalName, edtEPRenName]);
    DenyBlankValues([
      edtName
      ,edtLineLength
      , edtEPVoltageNominalName
      , edtEPRenName
      //, edtExtentForest
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    //DisableControls([spbEPRen, spbEPVoltageNominal]);
   if ENLine150Obj.element.geoDepartmentRef <> nil then
      if ENLine150Obj.element.geoDepartmentRef.code <> LOW_INT then
       begin
        // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENLine150Obj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtInvNumber.Text := ENLine150Obj.invNumber; 
    edtName.Text := ENLine150Obj.name; 
    edtBuhName.Text := ENLine150Obj.buhName; 
    if ( ENLine150Obj.lineLength <> nil ) then
       edtLineLength.Text := ENLine150Obj.lineLength.decimalString
    else
       edtLineLength.Text := ''; 
    if ( ENLine150Obj.yearBuild <> Low(Integer) ) then
       edtYearBuild.Text := IntToStr(ENLine150Obj.yearBuild)
    else
       edtYearBuild.Text := '';
    if ( ENLine150Obj.yearWorkingStart <> Low(Integer) ) then
       edtYearWorkingStart.Text := IntToStr(ENLine150Obj.yearWorkingStart)
    else
       edtYearWorkingStart.Text := '';
    edtNameProject.Text := ENLine150Obj.nameProject; 
    edtNameBuilder.Text := ENLine150Obj.nameBuilder; 
    MakeMultiline(edtMoreData.Lines, ENLine150Obj.moreData);

    if ( ENLine150Obj.chainsLength <> nil ) then
       edtChainsLength.Text := ENLine150Obj.chainsLength.decimalString
    else
       edtChainsLength.Text := '';

    if ( ENLine150Obj.chains2Length <> nil ) then
       edtChains2Length.Text := ENLine150Obj.chains2Length.decimalString
    else
       edtChains2Length.Text := ''; 

      if ENLine150Obj.lastRepairDate <> nil then
      begin
        edtLastRepairDate.DateTime:=EncodeDate(ENLine150Obj.lastRepairDate.Year,ENLine150Obj.lastRepairDate.Month,ENLine150Obj.lastRepairDate.Day);
        edtLastRepairDate.checked := true;
      end
      else
      begin
        edtLastRepairDate.DateTime:=SysUtils.Date;
        edtLastRepairDate.checked := false;
      end;
      if ENLine150Obj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENLine150Obj.dateGen.Year,ENLine150Obj.dateGen.Month,ENLine150Obj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
      if ( ENLine150Obj.extentForest <> nil ) then
         edtExtentForest.Text := ENLine150Obj.extentForest.decimalString
      else
         edtExtentForest.Text := '';

    //edtEPRenName.Text := ENLine150Obj.ren.name;

    if ENLine150Obj.element <> nil then
           if (ENLine150Obj.element.renRef <> nil ) then
         begin
          TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
           eFilter := ENElementFilter.Create;
           SetNullIntProps(eFilter);
           SetNullXSProps(eFilter);
           eFilter.code := ENLine150Obj.element.code;
          eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
          edtEPRenName.Text :=  eList.list[0].renRefName;
         end
        else
          edtEPRenName.Text := ''
    else
       edtEPRenName.Text := '';


    if ENLine150Obj.element.finExecutor <> nil then
      if ENLine150Obj.element.finExecutor.code > LOW_INT then
       begin
         edtFINExecutorName.Text := ENLine150Obj.element.finExecutor.name;
       end;


    edtEPVoltageNominalName.Text := ENLine150Obj.voltagenominal.value.DecimalString;
    //edtENElementName.Text := ENLine150Obj.element.name;

  end;
end;



procedure TfrmENLine150Edit.getBaseDistance;
var
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
begin
  if ENLine150Obj = nil then Exit;
  if ENLine150Obj.element = nil then Exit;
  if ENLine150Obj.element.code = Low(Integer) then Exit;

  TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;
  SetTXSDecimalForTEdit(edtBaseDistance, TempENObjectsTechnicalStatus.getBaseDistanceByElementCode(ENLine150Obj.element.code));
end;

procedure TfrmENLine150Edit.actAddAttachmentExecute(Sender: TObject);
begin
  ENDocAttachmentObj := ENDocAttachment.Create;
  try
    frmDFDocAttachmentEdit := TfrmDFDocAttachmentEdit.Create(Application, dsInsert);
    frmDFDocAttachmentEdit.elementCode := ENLine150Obj.element.code;
    frmDFDocAttachmentEdit.HideControls([frmDFDocAttachmentEdit.lblENDocAttachmentTypeTypeRefName,
                                         frmDFDocAttachmentEdit.edtENDocAttachmentTypeTypeRefName,
                                         frmDFDocAttachmentEdit.spbENDocAttachmentTypeTypeRef]);
    try
      if frmDFDocAttachmentEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentObj <> nil then
          updateAttachments;
      end;
    finally
      frmDFDocAttachmentEdit.Free;
      frmDFDocAttachmentEdit := nil;
    end;
  finally
    ENDocAttachmentObj.Free;
    ENDocAttachmentObj := nil;
  end;

end;

procedure TfrmENLine150Edit.actCopySheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  newSheetCode, objCode: Integer;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    objCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;

  if objCode = Low(Integer) then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте копіювати (Лист огляду об`єкта енергетики) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    newSheetCode := TempENInspectionSheet.copySheet(objCode);
    Application.MessageBox(PChar('Лист огляду скопійовано! Код = ' + IntToStr(newSheetCode)), PChar('Повідомлення'), MB_ICONINFORMATION);

    updateInspectionSheets;
  end;
end;

procedure TfrmENLine150Edit.actDeleteAttachmentExecute(Sender: TObject);
var
  TempENDocAttachment : ENDocAttachmentControllerSoapPort;
  ObjCode : Integer;
begin
  try
    ObjCode := StrToInt(sgENDocAttachment.Cells[0, sgENDocAttachment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити вкладення ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;
    TempENDocAttachment.remove(ObjCode);
    updateAttachments;
  end;
end;

procedure TfrmENLine150Edit.actDeleteENInspectionSheetExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0, sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Лист огляду об`єкта енергетики)?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.remove(sheetCode);
    updateInspectionSheets;
  end;
end;

procedure TfrmENLine150Edit.actEditENInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsEdit);
  try
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    try
      frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0, sgENInspectionSheet.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENInspectionSheetEdit.ShowModal = mrOk then
    begin
      updateInspectionSheets;
    end;
  finally
    frmENInspectionSheetEdit.Free;
    frmENInspectionSheetEdit := nil;
  end;
end;

procedure TfrmENLine150Edit.actEditExecute(Sender: TObject);
var
TempENPost: ENPostControllerSoapPort;
begin
     //Опори
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      try
        ENPostObj :=
          TempENPost.getObject(StrToInt(sgENPost.Cells[0, sgENPost.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENPostEdit := TfrmENPostEdit.Create(Application, dsEdit);
      try
        if frmENPostEdit.ShowModal= mrOk then
          actUpdateExecute(Sender);
      finally
        frmENPostEdit.Free;
        frmENPostEdit := nil;
      end;

end;

procedure TfrmENLine150Edit.actInsertENInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  voltageClassCode: Integer;
begin
  if DialogState = dsInsert then Exit;
  if ENLine150Obj = nil then Exit;
  if ENLine150Obj.element = nil then Exit;
  if ENLine150Obj.element.code = LOW_INT then Exit;

  frmENInspectionSheetAdd := TfrmENInspectionSheetAdd.Create(Application, dsInsert);
  try
    frmENInspectionSheetAdd.elementType := ENLine150Obj.element.typeRef.code;

    frmENInspectionSheetAdd.ENInspectionSheetObj := ENInspectionSheet.Create;
    SetNullIntProps(frmENInspectionSheetAdd.ENInspectionSheetObj);
    SetNullXSProps(frmENInspectionSheetAdd.ENInspectionSheetObj);

    frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef := ENElementRef.Create;
    frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef.code := ENLine150Obj.element.code;
    frmENInspectionSheetAdd.ENInspectionSheetObj.equipmentKind := EQUIPMENTKIND_HIGH_VOLTAGE;

    if ENLine150Obj.voltagenominal <> nil then
      if ENLine150Obj.voltagenominal.code > 0 then
      begin
        TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
        voltageClassCode := TempENInspectionSheet.getVoltageClassCodeByVoltageNominalCode(ENLine150Obj.voltagenominal.code);
        if voltageClassCode > 0 then
          frmENInspectionSheetAdd.voltageClassCode := voltageClassCode;
      end;

    if frmENInspectionSheetAdd.ShowModal = mrOk then
    begin
      if frmENInspectionSheetAdd.ENInspectionSheetObj <> nil then
        updateInspectionSheets;
    end;
  finally
    frmENInspectionSheetAdd.Free;
    frmENInspectionSheetAdd := nil;
  end;
end;

procedure TfrmENLine150Edit.actInsertExecute(Sender: TObject);
  begin //Опори
    ENPostObj := ENPost.Create;

    ENPostObj.element := ENElement.Create;
    ENPostObj.element.elementInRef := ENElementRef.Create;
    ENPostObj.element.elementInRef.code := ENLine150Obj.element.code;
    ENPostObj.element.renRef := EPRenRef.Create;
    ENPostObj.element.renRef.code := ENLine150Obj.element.renRef.code;

    if ENPostObj.line150Ref = nil then
      ENPostObj.line150Ref := ENLine150Ref.Create;
    ENPostObj.line150Ref.code := ENLine150Obj.code;
    //Добавляем связь с воздушной линией
    try
      frmENPostEdit := TfrmENPostEdit.Create(Application, dsInsert);
      try
        if frmENPostEdit.ShowModal = mrOk then
          begin
            if ENPostObj <> nil then
              actUpdateExecute(Sender);
          end;
      finally
        frmENPostEdit.Free;
        frmENPostEdit := nil;
      end;
    finally
      ENPostObj.Free;
    end;
  end;

procedure TfrmENLine150Edit.actLoadAttachmentExecute(Sender: TObject);
var
  i : Integer;
  result, fname, fileName, dir, ftpDir : string;
  ftpClient: TIdFTP;
  FileNames: TStrings;
  fileSize: Integer;
  att : ENDocAttachment;
  serv : ENDocAttachmentServer;
begin
  inherited;
  FileNames := TStringList.Create;

  try
    att := DMReports.getENDocAttachmentByCode(StrToInt(sgENDocAttachment.Cells[0,sgENDocAttachment.Row]));
    if att = nil then Exit;
    serv := DMReports.getENDocAttachmentServerByCode(att.serverRef.code);
    if serv = nil then Exit;
  except
    on EConvertError do Exit;
  end;

  fileName := ExtractFileName(att.fileLink);
  dir :=  ExtractFilePath(StringReplace(att.fileLink, '/', '\', [rfReplaceAll]));
  ftpDir := StringReplace(dir, '\', '/', [rfReplaceAll]);

  i := LastDelimiter('/' + PathDelim + DriveDelim, fileName);
  if (i > 0) and (fileName[i] = '/') then
    fname := Copy(fileName, i+1, MaxInt) else
    fname := '';

  ftpClient := TIdFTP.create(nil);
  try

    with ftpClient do begin
      Host:= serv.serverIp;
      Username:= serv.userName;
      Password:= serv.userPass;
    end;

    ftpClient.Connect();

    ftpClient.Passive := True;
    ftpClient.BeginWork(wmRead);
    ftpClient.ChangeDir('/'+ftpDir);
    ftpClient.List(FileNames, '', False);

    if not DirectoryExists(ExtractFilePath(Application.ExeName)+TempReportsPath) then
      CreateDir(ExtractFilePath(Application.ExeName)+TempReportsPath);

    with ftpClient.DirectoryListing do for i := 0 to Count - 1 do
    begin
      fileSize := ftpClient.Size(ftpClient.DirectoryListing[0].FileName);
      ftpClient.Get(ftpClient.DirectoryListing[0].FileName, ExtractFilePath(Application.ExeName)+TempReportsPath+fname, True, False);
    end;

    ftpClient.Disconnect();
  finally
    ftpClient.Free;
  end;

  ShellExecute(0,PChar('open'),PChar('"' + ExtractFilePath(Application.ExeName)+TempReportsPath+fname + '"'),
                nil,nil,SW_SHOWMAXIMIZED);

end;


procedure TfrmENLine150Edit.actSendToSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду на підпис?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.sendToSigning(sheetCode);
    updateInspectionSheets;
  end;
end;

procedure TfrmENLine150Edit.actSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати лист огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.signed(sheetCode);
    updateInspectionSheets;
  end;
end;

procedure TfrmENLine150Edit.actUnSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання листа огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigned(sheetCode);
    updateInspectionSheets;
  end;
end;

procedure TfrmENLine150Edit.actUnSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду в статус "чорновий"?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigning(sheetCode);
    updateInspectionSheets;
  end;
end;

procedure TfrmENLine150Edit.actUpdateAttachmentsExecute(Sender: TObject);
begin
  updateAttachments;
end;


procedure TfrmENLine150Edit.updateAttachments;
var
  TempENDocAttachment: ENDocAttachmentControllerSoapPort;
  ENDocAttachmentList: ENDocAttachmentShortList;
  docAttachmentFilter: ENDocAttachmentFilter;
  i, attachmentsCount: Integer;
begin
  ClearGrid(sgENDocAttachment);

  if DialogState = dsInsert then Exit;
  if ENLine150Obj = nil then Exit;
  if ENLine150Obj.element = nil then Exit;
  if ENLine150Obj.element.code = LOW_INT then Exit;

  TempENDocAttachment := HTTPRIOENDocAttachment as ENDocAttachmentControllerSoapPort;

  docAttachmentFilter := ENDocAttachmentFilter.Create;
  SetNullIntProps(docAttachmentFilter);
  SetNullXSProps(docAttachmentFilter);

  docAttachmentFilter.status := ENDocAttachmentStatusRef.Create;
  docAttachmentFilter.status.code := ENDOCATTACHMENTSTATUS_ACTIVE;

  docAttachmentFilter.conditionSQL := ' code in (select endocattachment2enlmnt.docattachmentrefcode '+
    ' from endocattachment2enlmnt where endocattachment2enlmnt.elementrefcode = ' + IntToStr(ENLine150Obj.element.code) + ')';

  ENDocAttachmentList := TempENDocAttachment.getScrollableFilteredList(docAttachmentFilter, 0, -1);

  attachmentsCount := High(ENDocAttachmentList.list);

  if attachmentsCount > -1 then
    sgENDocAttachment.RowCount := attachmentsCount + 2
  else
    sgENDocAttachment.RowCount := 2;

  with sgENDocAttachment do
    for i := 0 to attachmentsCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENDocAttachmentList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENDocAttachmentList.list[i].commentGen;
        Cells[2,i+1] := ENDocAttachmentList.list[i].fileLink;
        Cells[3,i+1] := ENDocAttachmentList.list[i].userAdd;
        if ENDocAttachmentList.list[i].dateAdd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateAdd);
        Cells[5,i+1] := ENDocAttachmentList.list[i].userGen;
        if ENDocAttachmentList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENDocAttachmentList.list[i].dateEdit);

        sgENDocAttachment.RowCount := i + 2;
      end;

  sgENDocAttachment.Row := 1;

end;

procedure TfrmENLine150Edit.updateInspectionSheets;
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  ENInspectionSheetList: ENInspectionSheetShortList;
  inspectionSheetFilter: ENInspectionSheetFilter;
  i, sheetsCount: Integer;
begin
  ClearGrid(sgENInspectionSheet);

  if DialogState = dsInsert then Exit;
  if ENLine150Obj = nil then Exit;
  if ENLine150Obj.element = nil then Exit;
  if ENLine150Obj.element.code = LOW_INT then Exit;

  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  inspectionSheetFilter := ENInspectionSheetFilter.Create;
  SetNullIntProps(inspectionSheetFilter);
  SetNullXSProps(inspectionSheetFilter);

  inspectionSheetFilter.elementRef := ENElementRef.Create;
  inspectionSheetFilter.elementRef.code := ENLine150Obj.element.code;

  ENInspectionSheetList := TempENInspectionSheet.getScrollableFilteredList(inspectionSheetFilter, 0, -1);
  sheetsCount := High(ENInspectionSheetList.list);

  if sheetsCount > -1 then
     sgENInspectionSheet.RowCount := sheetsCount + 2
  else
     sgENInspectionSheet.RowCount := 2;

  with sgENInspectionSheet do
  for i := 0 to sheetsCount do
    begin
      Application.ProcessMessages;
      if ENInspectionSheetList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENInspectionSheetList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := ENInspectionSheetList.list[i].name;
      Cells[2,i+1] := ENInspectionSheetList.list[i].inspectionKindName;
      Cells[3,i+1] := ENInspectionSheetList.list[i].statusRefName;

      if ENInspectionSheetList.list[i].dateGen = nil then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateGen);

      Cells[5,i+1] := ENInspectionSheetList.list[i].userGen;

      if ENInspectionSheetList.list[i].dateEdit = nil then
        Cells[6,i+1] := ''
      else
        Cells[6,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateEdit);
    end;

  sgENInspectionSheet.Row := 1;

  sgENInspectionSheetClick(sgENInspectionSheet);
end;

procedure TfrmENLine150Edit.actUpdateENInspectionSheetExecute(Sender: TObject);
begin
  updateInspectionSheets;
end;

procedure TfrmENLine150Edit.actUpdateExecute(Sender: TObject);
var
TempENPost: ENPostControllerSoapPort;
ENPostList: ENPostShortList;
i, Allow :Integer;
    begin //Опори
      SetGridHeaders(ENPostHeaders, sgENPost.ColumnHeaders);
      pColCount := 100;
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      if pFilterObject = nil then
        begin
          pFilterObject := ENPostFilter.Create;
          SetNullIntProps(pFilterObject);
          SetNullXSProps(pFilterObject);
        end;

      pFilterObject.conditionSQL :=
        ' ENPOST.LINE150REFCODE = ' + IntToStr(ENLine150Obj.code);

      ENPostList := TempENPost.getScrollableFilteredList(
        ENPostFilter(pFilterObject), 0, pColCount);
      pLastCount:=High(ENPostList.list);
      if pLastCount > -1 then
         sgENPost.RowCount := pLastCount + 2
      else
         sgENPost.RowCount := 2;
      with sgENPost do
        for i := 0 to pLastCount do
          begin
            Application.ProcessMessages;

            if ENPostList.list[i].code <> Low(Integer) then //Код
              Cells[0, i + 1] := IntToStr(ENPostList.list[i].code)
            else
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENPostList.list[i].postTtypeName; //Тип опори
            Cells[2, i + 1] := ENPostList.list[i].groundName; //Заземлення
            Cells[3, i + 1] := ENPostList.list[i].postNumberGen; //Номер опори
            if ENPostList.list[i].woodenLength <> nil then
              Cells[4, i + 1] := ENPostList.list[i].woodenLength.decimalString; //Довжина стояка, м
            if ENPostList.list[i].lastRepairDate = nil then
              Cells[5, i + 1] := '' //Дата останнього ремонту
            else
              Cells[5, i + 1] := XSDate2String(
                ENPostList.list[i].lastRepairDate);
            Cells[6, i + 1] := IntToSTr(ENPostList.list[i].yearSetup); //Рік встановлення
            //Cells[7, i + 1] := ENPostList.list[i].materialRefName; //Матеріал опори
            Cells[7, i + 1] := ENPostList.list[i].name; //Назва опори
            pLastRow := i + 1;
            sgENPost.RowCount := pLastRow + 1;
          end;
      pColCount := pColCount + 1;
      sgENPost.Row := 1;
      //sgENPost.OnRowChanging(sgENPost, 0, sgENPost.Row, Allow);
    end; //else if pcLine10.ActivePage = tsPost then

procedure TfrmENLine150Edit.actViewExecute(Sender: TObject);
var
 TempENPost: ENPostControllerSoapPort;                   //Опори
begin //Опори
      TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
      try
        ENPostObj := TempENPost.getObject(
          StrToInt(sgENPost.Cells[0, sgENPost.Row]));
      except
        on EConvertError do Exit;
      end;
      frmENPostEdit := TfrmENPostEdit.Create(Application, dsView);
      try
        frmENPostEdit.ShowModal;
      finally
        frmENPostEdit.Free;
        frmENPostEdit := nil;
      end;
end;

procedure TfrmENLine150Edit.actViewInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsView);
  try
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    try
      frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0, sgENInspectionSheet.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmENInspectionSheetEdit.ShowModal = mrOk then
    begin
      updateInspectionSheets;
    end;
  finally
    frmENInspectionSheetEdit.Free;
    frmENInspectionSheetEdit := nil;
  end;
end;

procedure TfrmENLine150Edit.btnEvaluateTechnicalStatusClick(Sender: TObject);
var
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
begin
  inherited;
  if ENLine150Obj = nil then Exit;
  if ENLine150Obj.code = Low(Integer) then Exit;

  if (DialogState = dsEdit) or (DialogState = dsInsert) then
  if not NoBlankValues([ edtTotalCountArmored, edtTotalCountMetal, edtTotalLengthCable,
          edtTotalCountInsulator, edtTotalCountTraverse,
          edtTotalCountArmature, edtTotalLengthGroundWire, edtTotalCountFooting,
          edtLengthToReconstruct, edtBaseDistance ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end
  else
  begin

    if ( edtTotalCountArmored.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountArmored := StrToInt(edtTotalCountArmored.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountArmored := Low(Integer);

    if ( edtTotalCountMetal.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountMetal := StrToInt(edtTotalCountMetal.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountMetal := Low(Integer);

    ENObjectsTechnicalStatusObj.totalLengthCable := GetTXSDecimalFromTEdit(edtTotalLengthCable);

    if ( edtTotalCountInsulator.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountInsulator := StrToInt(edtTotalCountInsulator.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountInsulator := Low(Integer);

    if ( edtTotalCountTraverse.Text <> '' ) then
      ENObjectsTechnicalStatusObj.totalCountTraverse := StrToInt(edtTotalCountTraverse.Text)
    else
      ENObjectsTechnicalStatusObj.totalCountTraverse := Low(Integer);

    ///////////////////////
    ENObjectsTechnicalStatusObj.totalCountArmature := GetIntFromTEdit(edtTotalCountArmature);
    ENObjectsTechnicalStatusObj.totalLengthGroundWire := GetTXSDecimalFromTEdit(edtTotalLengthGroundWire);
    ENObjectsTechnicalStatusObj.totalCountFooting := GetIntFromTEdit(edtTotalCountFooting);
    ///////////////////////

    ENObjectsTechnicalStatusObj.baseDistance := GetTXSDecimalFromTEdit(edtBaseDistance);

    ENObjectsTechnicalStatusObj.lengthToReconstruct := GetTXSDecimalFromTEdit(edtLengthToReconstruct);

    TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;
    TempENObjectsTechnicalStatus.add(ENObjectsTechnicalStatusObj);
    LoadTechnicalStatus(Sender);
  end;
end;

procedure TfrmENLine150Edit.btnGeographClearClick(Sender: TObject);
begin
  inherited;
  ENLine150Obj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';
end;

procedure TfrmENLine150Edit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENLine150Obj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENLine150Edit.btnPrintClick(Sender: TObject);
var
  argNames, args: EnergyProController.ArrayOfString;
  reportName: String;
begin
  inherited;
  if ENLine150Obj.element = nil then Exit;
  if ENLine150Obj.element.code = Low(Integer) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'elementCode';
  args[0] := IntToStr(ENLine150Obj.element.code);

  reportName := 'TechnicalStatus/technicalStatusLine';
  makeReport(reportName, argNames, args, 'xls');
end;

//else if pcLine10.ActivePage = tsPost then

procedure TfrmENLine150Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine150: ENLine150ControllerSoapPort;
    Line150Filter: ENLine150Filter;
    Line150List: ENLine150ShortList;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtLineLength
      , edtEPVoltageNominalName
      , edtEPRenName
      //, edtExtentForest
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;

    ///////
    if (edtName.Text <> '') and (edtInvNumber.Text <> '') then
    begin
      Line150Filter := ENLine150Filter.Create;
      try
        SetNullIntProps(Line150Filter);
        SetNullXSProps(Line150Filter);

        Line150Filter.invNumber := Trim(edtInvNumber.Text);
        Line150Filter.name := Trim(edtName.Text);
        if DialogState = dsEdit then
          Line150Filter.conditionSQL := 'code <> ' + IntToStr(ENLine150Obj.code);

        Line150List := TempENLine150.getScrollableFilteredList(Line150Filter, 0, -1);
        if Line150List.totalCount > 0 then
        begin
          Application.MessageBox(PChar('Объект с таким именем и инвентарным номером уже существует (код: ' + IntToStr(Line150List.list[0].code) + ')!'), PChar('Внимание !'), MB_ICONWARNING+MB_OK);
          Action := caNone;
          Exit;
        end;
      finally
        Line150Filter.Free;
      end;
    end;
    ///////

     ENLine150Obj.invNumber := edtInvNumber.Text; 

     ENLine150Obj.name := edtName.Text; 

     ENLine150Obj.buhName := edtBuhName.Text; 

     if (ENLine150Obj.lineLength = nil ) then
       ENLine150Obj.lineLength := TXSDecimal.Create;
     if edtLineLength.Text <> '' then
       ENLine150Obj.lineLength.decimalString := edtLineLength.Text 
     else
       ENLine150Obj.lineLength := nil;

     if ( edtYearBuild.Text <> '' ) then
       ENLine150Obj.yearBuild := StrToInt(edtYearBuild.Text)
     else
       ENLine150Obj.yearBuild := Low(Integer) ;

     if ( edtYearWorkingStart.Text <> '' ) then
       ENLine150Obj.yearWorkingStart := StrToInt(edtYearWorkingStart.Text)
     else
       ENLine150Obj.yearWorkingStart := Low(Integer) ;

     ENLine150Obj.nameProject := edtNameProject.Text; 

     ENLine150Obj.nameBuilder := edtNameBuilder.Text; 

     ENLine150Obj.moreData := edtMoreData.Text; 

     if (ENLine150Obj.chainsLength = nil ) then
       ENLine150Obj.chainsLength := TXSDecimal.Create;
     if edtChainsLength.Text <> '' then
       ENLine150Obj.chainsLength.decimalString := edtChainsLength.Text 
     else
       ENLine150Obj.chainsLength := nil;


     if (ENLine150Obj.chains2Length = nil ) then
       ENLine150Obj.chains2Length := TXSDecimal.Create;
     if edtChains2Length.Text <> '' then
       ENLine150Obj.chains2Length.decimalString := edtChains2Length.Text 
     else
       ENLine150Obj.chains2Length := nil;

       
     if edtlastRepairDate.checked then
     begin 
       if ENLine150Obj.lastRepairDate = nil then
          ENLine150Obj.lastRepairDate := TXSDate.Create;
       ENLine150Obj.lastRepairDate.XSToNative(GetXSDate(edtlastRepairDate.DateTime));
     end
     else
       ENLine150Obj.lastRepairDate := nil;

     if edtdateGen.checked then
     begin 
       if ENLine150Obj.dateGen = nil then
          ENLine150Obj.dateGen := TXSDate.Create;
       ENLine150Obj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENLine150Obj.dateGen := nil;

    if (ENLine150Obj.extentForest = nil ) then
      ENLine150Obj.extentForest := TXSDecimal.Create;
    if edtExtentForest.Text <> '' then
      ENLine150Obj.extentForest.decimalString := edtExtentForest.Text
    else
      ENLine150Obj.extentForest := nil;

    if DialogState = dsInsert then
    begin
      ENLine150Obj.code:=low(Integer);
      TempENLine150.add(ENLine150Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLine150.save(ENLine150Obj);
    end;
  end;
end;

procedure TfrmENLine150Edit.sgCCDamageLogDblClick(Sender: TObject);
Var
   TempCCDamageLog: CCDamageLogControllerSoapPort;
begin
   TempCCDamageLog := HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

   frmCCDamageLogEdit:=TfrmCCDamageLogEdit.Create(Application, dsView);
   try
     frmCCDamageLogEdit.CCDamageLogObj := TempCCDamageLog.getObject(StrToInt(sgCCDamageLog.Cells[0,sgCCDamageLog.Row]));
   except
   on EConvertError do Exit;
   end;
   try
     frmCCDamageLogEdit.ShowModal;
   finally
     frmCCDamageLogEdit.Free;
     frmCCDamageLogEdit:=nil;
   end;
end;

procedure TfrmENLine150Edit.sgCCElementDataDblClick(Sender: TObject);
var
  TempCCElementData: CCElementDataControllerSoapPort;
begin
  TempCCElementData := HTTPRIOCCElementData as CCElementDataControllerSoapPort;
  try
    CCElementDataObj := TempCCElementData.getObject(StrToInt(sgCCElementData.Cells[0,sgCCElementData.Row]));
  except
    on EConvertError do Exit;
  end;

  frmCCElementDataEdit:=TfrmCCElementDataEdit.Create(Application, dsView);

  try
    frmCCElementDataEdit.ShowModal;
  finally
    frmCCElementDataEdit.Free;
    frmCCElementDataEdit:=nil;
  end;
end;

procedure TfrmENLine150Edit.sgENInspectionSheetClick(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0, sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actEditENInspectionSheet.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actDeleteENInspectionSheet.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
end;

procedure TfrmENLine150Edit.spbEPRenClick(Sender : TObject);
var 
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine150Obj.element.renRef = nil then ENLine150Obj.element.renRef := EPRenRef.Create();
               ENLine150Obj.element.renRef.code  := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;


procedure TfrmENLine150Edit.spbEPVoltageNominalClick(Sender : TObject);
var 
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
   EPVoltageNominalFilterObj: EPVoltageNominalFilter; 
begin
   EPVoltageNominalFilterObj := EPVoltageNominalFilter.Create;
   SetNullIntProps(EPVoltageNominalFilterObj);
   SetNullXSProps(EPVoltageNominalFilterObj);
   EPVoltageNominalFilterObj.conditionSQL := ' code in (1,2,3,4)';

   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application, fmNormal, EPVoltageNominalFilterObj);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLine150Obj.voltagenominal = nil then ENLine150Obj.voltagenominal := EPVoltageNominal.Create();
               ENLine150Obj.voltagenominal.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;


procedure TfrmENLine150Edit.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               ENLine150Obj.element.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                        DMReports.getFullExecutorName(tvDep.Selected));

               edtFINExecutorName.Text := ENLine150Obj.element.finExecutor.name;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmENLine150Edit.spbGetBaseDistanceClick(Sender: TObject);
begin
  getBaseDistance;
end;

procedure TfrmENLine150Edit.spbOSSelectClick(Sender: TObject);
var
frmOSTableShow: TfrmOSTableShow;
f : OStableFilter;
begin

     f := OStableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     // инвентарные ЛИНИЙ могут быть взяты с Подстанций  (код обор 11)... СКадовск - 006089 !!!
     f.conditionSQL := ' OSTABLE.KOD_VID in (3, 11) '; // Линии как передающие утр-ва  и ЕНЕРГЕТИЧЕСКИЕ МАШИНЫ

     if length(edtInvNumber.Text) > 0 then
       f.kod_inv := '*' + edtInvNumber.Text + '*';

     f.orderBySQL :=  'OSTABLE.STR_NAME';

   frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
   //frmOSTableShow.SendType := 444; /// для энерго ....
   try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
            try
               //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
               edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
               edtBuhName.Text := GetReturnValue(sgOSTable,1);

               DisableControls([edtInvNumber, edtBuhName]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmOSTableShow.Free;
   end;
end;

procedure TfrmENLine150Edit.tbiDamagesXLSClick(Sender: TObject);
Var
  request: CCReportRequestEx;
  argNames, args: CCReportController.ArrayOfString;
  reportType : String;
begin

    if (ENLine150Obj.element=nil) or (ENLine150Obj.element.code=Low(Integer)) then
    begin
       Exit;
    end;

    request := CCReportRequestEx.Create;

    SetLength(argNames,2);
    SetLength(args,2);
    request.reportCode := 0;
    argNames[0] := 'nodeCode';
    args[0] := '-1';
    argNames[1] := 'elementCode';
    args[1] := IntToStr(ENLine150Obj.element.code);

    request.argNames:=argNames;
    request.args:=args;
    request.resultType:=Low(Integer);

    request.funcName := '/com/ksoe/callcenter/reports/Dispetcher/ByNode_Damages_T32.jasper';
    reportType := 'xls';

    CCDMReport.makeGeneralReportPDF('RequestLog', request, reportType);
end;

procedure TfrmENLine150Edit.LoadCCElement();
var
  i, j: Integer;
  TempCCElementData: CCElementDataControllerSoapPort;
  ccElementList: CCElementDataShortList;
  ccElementFilter: CCElementDataFilter;
  LastCount: Integer;
  selectedRow: Integer;
begin
  selectedRow:=sgCCElementData.Row;

  for i:=1 to sgCCElementData.RowCount-1 do
  for j:=0 to sgCCElementData.ColCount-1 do
  begin
     sgCCElementData.Cells[j,i]:='';
     if sgCCElementData.CellControls[j,i]<>nil then sgCCElementData.CellControls[j,i].Destroy;
  end;

  if (ENLine150Obj.element=nil) or (ENLine150Obj.element.code=Low(Integer)) then Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  {ENVOLTAGECLASS_150 = 1;
  ENVOLTAGECLASS_35  = 2;
  ENVOLTAGECLASS_10  = 3;
  ENVOLTAGECLASS_6   = 4;}

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);
  ccElementFilter.elementCode:=ENLine150Obj.element.code;
  ccElementFilter.orderBySQL:='name';

  ccElementList := TempCCElementData.getScrollableFilteredList(ccElementFilter,0,-1);
  LastCount:=High(ccElementList.list);

  if LastCount > -1 then
     sgCCElementData.RowCount:=LastCount+2
  else
     sgCCElementData.RowCount:=2;

   with sgCCElementData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ccElementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ccElementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ccElementList.list[i].name;
        Cells[2,i+1] := ccElementList.list[i].res;
        Cells[3,i+1] := ccElementList.list[i].nodetypeName;
        Cells[4,i+1] := ccElementList.list[i].uid;

        CellControls[5,i+1] := TButton.Create(sgCCElementData);
        TButton(CellControls[5,i+1]).Parent := sgCCElementData;
        TButton(CellControls[5,i+1]).Tag := i+1;
        TButton(CellControls[5,i+1]).OnClick := OpenSLAMO;
        TButton(CellControls[5,i+1]).Caption := 'Открыть';
      end;

    sgCCElementData.Row:=1;

    if selectedRow <> 0 then
    begin
    if sgCCElementData.RowCount > selectedRow then
      sgCCElementData.Row := selectedRow
    else
      sgCCElementData.Row := sgCCElementData.RowCount - 1;
    end
    else
      sgCCElementData.Row:=1;
end;

procedure TfrmENLine150Edit.LoadCCDamageLog();
var
  TempCCDamageLog: CCDamageLogControllerSoapPort;
  damFilter: CCDamageLogFilter;
  damList: CCDamageLogShortList;
  i,j: Integer;
  selectedRow: Integer;
begin
  selectedRow:=sgCCDamageLog.Row;

  for i:=1 to sgCCDamageLog.RowCount-1 do
  for j:=0 to sgCCDamageLog.ColCount-1 do
  begin
     sgCCDamageLog.Cells[j,i]:='';
     sgCCDamageLog.Colors[j,i]:=clNone;
     sgCCDamageLog.FontColors[j,i]:=clWindowText;
  end;

  if (ENLine150Obj.element=nil) or (ENLine150Obj.element.code=Low(Integer)) then Exit;

  TempCCDamageLog :=  HTTPRIOCCDamageLog as CCDamageLogControllerSoapPort;

  damFilter := CCDamageLogFilter.Create;
  SetNullIntProps(damFilter);
  SetNullXSProps(damFilter);
  damFilter.conditionSQL:=
      ' CCDamageLog.statuscode in (0,1,2,3,6,10,11) '+
      ' and CCDamageLog.subtyperefcode=32 '+
      ' and CCDamageLog.departmentrefcode=0 '+
      ' and ('+
      '   CCDamageLog.nodecode in (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLine150Obj.element.code)+')'+
      '   or '+
      '   CCDamageLog.nodecode in (select g.code from ccnodegroup g where g.parentnormalcode in '+
      '     (select n2e.nodecode from ccnode2enelement n2e where n2e.elementcode='+IntToStr(ENLine150Obj.element.code)+'))'+
      ')';
  damFilter.orderBySQL:=
      'CCDamageLog.code desc';

  damList := TempCCDamageLog.getScrollableFilteredList(damFilter,0,100);

  if High(damList.list) > -1 then
     sgCCDamageLog.RowCount:=High(damList.list)+2
  else
     sgCCDamageLog.RowCount:=2;

   with sgCCDamageLog do
    for i:=0 to High(damList.list) do
      begin
        Application.ProcessMessages;
        if damList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(damList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := damList.list[i].kindName;

        if (damList.list[i].kindCode=0) and (damList.list[i].datedamage<>nil) then
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datedamage)
        else
        if (damList.list[i].kindCode<>0) and (damList.list[i].datestart<>nil) then
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datestart)
        else
        if (damList.list[i].kindCode<>0) and (damList.list[i].datedamage<>nil) then
        begin
          Cells[2,i+1] := XSDateTimeWithDate2String(damList.list[i].datedamage);
        end
        else
          Cells[2,i+1] := '';

        if damList.list[i].dateend <> nil then
          Cells[3,i+1] := XSDateTimeWithDate2String(damList.list[i].dateend)
        else
          Cells[3,i+1] := '';

        Cells[4,i+1] := damList.list[i].nodetxt;
        Cells[5,i+1] := damList.list[i].subtyperefMark;
        Cells[6,i+1] := damList.list[i].statusName;
        Cells[7,i+1] := damList.list[i].reasontxt;

        // Подсветка места отключения
        //Colors[4,i+1] := damageColorByStatus(damList.list[i].statusCode, damList.list[i].urgent);
      end;

    if selectedRow <> 0 then
    begin
    if sgCCDamageLog.RowCount > selectedRow then
      sgCCDamageLog.Row := selectedRow
    else
      sgCCDamageLog.Row := sgCCDamageLog.RowCount - 1;
    end
    else
      sgCCDamageLog.Row:=1;
end;

procedure TfrmENLine150Edit.LoadTechnicalStatus(Sender: TObject);
var
  i, settingsLastCount, settingsLastRow: Integer;
  TempENObjectsTechnicalStatus: ENObjectsTechnicalStatusControllerSoapPort;
  technicalStatusFilter: ENObjectsTechnicalStatusFilter;
  technicalStatusArr: ENObjectsTechnicalStatusController.ArrayOfInteger;
  settingsFilter: ENSettingsFilter;
  TempENSettings: ENSettingsControllerSoapPort;
  ENSettingsList: ENSettingsShortList;
begin
  if ENLine150Obj = nil then Exit;
  if ENLine150Obj.code = Low(Integer) then Exit;

  SetGridHeaders(ENSettingsHeaders, sgENSettings.ColumnHeaders);
  TempENObjectsTechnicalStatus := HTTPRIOENObjectsTechnicalStatus as ENObjectsTechnicalStatusControllerSoapPort;

  technicalStatusFilter := ENObjectsTechnicalStatusFilter.Create;
  SetNullIntProps(technicalStatusFilter);
  SetNullXSProps(technicalStatusFilter);
  technicalStatusFilter.elementRef := ENElementRef.Create;
  technicalStatusFilter.elementRef.code := ENLine150Obj.element.code;

  technicalStatusArr := TempENObjectsTechnicalStatus.getScrollableFilteredCodeArray(technicalStatusFilter, 0, -1);
  if High(technicalStatusArr) > -1 then
  begin
    try
      ENObjectsTechnicalStatusObj := TempENObjectsTechnicalStatus.getObject(technicalStatusArr[0]);
    except
      on EConvertError do Exit;
    end;

    if ENObjectsTechnicalStatusObj <> nil then
    begin

      if ( ENObjectsTechnicalStatusObj.totalCountArmored <> Low(Integer) ) then
        edtTotalCountArmored.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountArmored)
      else
        edtTotalCountArmored.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountArmored <> Low(Integer) ) then
        edtDefectCountArmored.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountArmored)
      else
        edtDefectCountArmored.Text := '';

      if ( ENObjectsTechnicalStatusObj.totalCountMetal <> Low(Integer) ) then
        edtTotalCountMetal.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountMetal)
      else
        edtTotalCountMetal.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountMetal <> Low(Integer) ) then
        edtDefectCountMetal.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountMetal)
      else
        edtDefectCountMetal.Text := '';

      SetTXSDecimalForTEdit(edtTotalLengthCable, ENObjectsTechnicalStatusObj.totalLengthCable);
      SetTXSDecimalForTEdit(edtDefectLengthtCable, ENObjectsTechnicalStatusObj.defectLengthtCable);

      if ( ENObjectsTechnicalStatusObj.totalCountInsulator <> Low(Integer) ) then
        edtTotalCountInsulator.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountInsulator)
      else
        edtTotalCountInsulator.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountInsulator <> Low(Integer) ) then
        edtDefectCountInsulator.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountInsulator)
      else
        edtDefectCountInsulator.Text := '';

      if ( ENObjectsTechnicalStatusObj.totalCountTraverse <> Low(Integer) ) then
        edtTotalCountTraverse.Text := IntToStr(ENObjectsTechnicalStatusObj.totalCountTraverse)
      else
        edtTotalCountTraverse.Text := '';

      if ( ENObjectsTechnicalStatusObj.defectCountTraverse <> Low(Integer) ) then
        edtDefectCountTraverse.Text := IntToStr(ENObjectsTechnicalStatusObj.defectCountTraverse)
      else
        edtDefectCountTraverse.Text := '';

      SetIntForTEdit(edtTotalCountArmature, ENObjectsTechnicalStatusObj.totalCountArmature);
      SetIntForTEdit(edtDefectCountArmature, ENObjectsTechnicalStatusObj.defectCountArmature);
      SetTXSDecimalForTEdit(edtTotalLengthGroundWire, ENObjectsTechnicalStatusObj.totalLengthGroundWire);
      SetTXSDecimalForTEdit(edtDefectLengthGroundWire, ENObjectsTechnicalStatusObj.defectLengthGroundWire);
      SetIntForTEdit(edtTotalCountFooting, ENObjectsTechnicalStatusObj.totalCountFooting);
      SetIntForTEdit(edtDefectCountFooting, ENObjectsTechnicalStatusObj.defectCountFooting);

      SetTXSDecimalForTEdit(edtBaseDistance, ENObjectsTechnicalStatusObj.baseDistance);
      SetTXSDecimalForTEdit(edtVKDI, ENObjectsTechnicalStatusObj.vKDI);
      SetTXSDecimalForTEdit(edtVKDP, ENObjectsTechnicalStatusObj.vKDP);
      SetTXSDecimalForTEdit(edtVKDO, ENObjectsTechnicalStatusObj.vKDO);
      SetTXSDecimalForTEdit(edtVKDA, ENObjectsTechnicalStatusObj.vKDA);
      SetTXSDecimalForTEdit(edtVKDT, ENObjectsTechnicalStatusObj.vKDT);
      SetTXSDecimalForTEdit(edtVKDF, ENObjectsTechnicalStatusObj.vKDF);
      SetTXSDecimalForTEdit(edtVKD, ENObjectsTechnicalStatusObj.vKD);
      SetTXSDecimalForTEdit(edtMaxFallPower, ENObjectsTechnicalStatusObj.maxFallPower);
      SetTXSDecimalForTEdit(edtLengthToReconstruct, ENObjectsTechnicalStatusObj.lengthToReconstruct);

    end;
  end else
  begin
    ENObjectsTechnicalStatusObj := ENObjectsTechnicalStatus.Create;
    SetNullIntProps(ENObjectsTechnicalStatusObj);
    SetNullXSProps(ENObjectsTechnicalStatusObj);

    ENObjectsTechnicalStatusObj.elementRef := ENElementRef.Create;
    ENObjectsTechnicalStatusObj.elementRef.code := ENLine150Obj.element.code;

    // определение расстояния от базы обслуживания
    if DialogState <> dsView then
      getBaseDistance;
  end;

  TempENSettings := HTTPRIOENSettings as ENSettingsControllerSoapPort;
  settingsFilter := ENSettingsFilter.Create;
  SetNullIntProps(settingsFilter);
  SetNullXSProps(settingsFilter);
  settingsFilter.conditionSQL := 'ensettings.code in ( ' + IntToStr(TECHNICALSTATUS_TRANSFERTARIFF)
      + ', ' + IntToStr(TECHNICALSTATUS_FINE) + ', ' + IntToStr(TECHNICALSTATUS_DISTRIBUTIONTARIFF)
      + ', ' + IntToStr(TECHNICALSTATUS_BLINECAPEX) + ' )';

  ENSettingsList := TempENSettings.getScrollableFilteredList(settingsFilter, 0, -1);
  settingsLastCount := High(ENSettingsList.list);

  if settingsLastCount > -1 then
     sgENSettings.RowCount := settingsLastCount + 2
  else
     sgENSettings.RowCount := 2;

  with sgENSettings do
    for i:=0 to settingsLastCount do
      begin
        if ENSettingsList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSettingsList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENSettingsList.list[i].comment;
        Cells[2,i+1] := ENSettingsList.list[i].currentValue;

        settingsLastRow := i + 1;
        sgENSettings.RowCount := settingsLastRow + 1;
      end;

  sgENSettings.Row := 1;
end;

procedure TfrmENLine150Edit.pcENLine150Change(Sender: TObject);
begin
  if (pcENLine150.ActivePage = tsCCElement) then LoadCCElement();
  if (pcENLine150.ActivePage = tsCCDamageLog) then LoadCCDamageLog();
  if (pcENLine150.ActivePage = tsPost35_150 ) then actUpdateExecute(Sender);
  if pcENLine150.ActivePage = tsAttachments then
  begin;
    SetGridHeaders(ENDocAttachmentHeaders, sgENDocAttachment.ColumnHeaders);
    ClearGrid(sgENDocAttachment);
    updateAttachments;
  end;

  if pcENLine150.ActivePage = tsENInspectionSheet then
    updateInspectionSheets;
end;

procedure TfrmENLine150Edit.pmInspectionSheetPopup(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actSendToSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actUnSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actUnSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_SIGNED);
end;

procedure TfrmENLine150Edit.OpenSLAMO(Sender: TObject);
var
  TempCCElementData: CCElementDataControllerSoapPort;
  TempCCFeeder: CCFeederControllerSoapPort;
  CCFeederObj: CCFeeder;
begin
  TempCCElementData := HTTPRIOCCElementData as CCElementDataControllerSoapPort;
  TempCCFeeder:=HTTPRIOCCFeeder as CCFeederControllerSoapPort;

  sgCCElementData.Row:=TButton(Sender).Tag;

  try
    CCElementDataObj := TempCCElementData.getObject(StrToInt(sgCCElementData.Cells[0,sgCCElementData.Row]));
  except
    on EConvertError do Exit;
  end;

  CCFeederObj:=TempCCFeeder.getObject(CCElementDataObj.code);

  if CCFeederObj=nil then Exit;

  frmTopologyF10Edit:=TfrmTopologyF10Edit.Create(Application, fmNormal);
  frmTopologyF10Edit.CCFeederObj:=CCFeederObj;
  try
    frmTopologyF10Edit.ShowModal;
  finally
    frmTopologyF10Edit.Free;
    frmTopologyF10Edit:=nil;
  end;
end;

end.
