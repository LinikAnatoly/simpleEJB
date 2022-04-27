
unit EditENIPItem;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENIPItemController, AdvObj,
  ENPlanWorkController, EditENPlanWork, ENPlanWorkKindController, ShowENPlanWork,
  ENPlanWorkTypeController, ENIPItem2PlanController,
  ENIPItem2TKMaterialsController, TKMaterialsController, ShowTKMaterials ;

type
  TfrmENIPItemEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    lblName: TLabel;
    lblBuhName: TLabel;
    lblItemNumber: TLabel;
    edtItemNumber: TEdit;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblFinancing: TLabel;
    edtFinancing: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    spbTKMeasurementMeasurement: TSpeedButton;
    edtTKMeasurementMeasurementName: TEdit;
    lblTKMeasurementMeasurementName: TLabel;
    lblCode: TLabel;
    edtCode: TEdit;
    HTTPRIOENIPItem: THTTPRIO;
    spbENElement: TSpeedButton;
    edtName: TEdit;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    edtBuhName: TEdit;
    spbFinancing: TSpeedButton;
    chkIsProjectDocument: TCheckBox;
    gbNKRE: TGroupBox;
    lblCountGen: TLabel;
    lblPrice: TLabel;
    lblSumGen: TLabel;
    lblQuarter1count: TLabel;
    lblQuarter1sum: TLabel;
    lblQuarter2count: TLabel;
    lblQuarter2sum: TLabel;
    lblQuarter3count: TLabel;
    lblQuarter3sum: TLabel;
    lblQuarter4count: TLabel;
    lblQuarter4sum: TLabel;
    edtCountGen: TEdit;
    edtPrice: TEdit;
    edtSumGen: TEdit;
    edtQuarter1count: TEdit;
    edtQuarter1sum: TEdit;
    edtQuarter2count: TEdit;
    edtQuarter2sum: TEdit;
    edtQuarter3count: TEdit;
    edtQuarter3sum: TEdit;
    edtQuarter4count: TEdit;
    edtQuarter4sum: TEdit;
    lblMethodExecutework: TLabel;
    edtlMethodExecutework: TEdit;
    spblMethodExecutework: TSpeedButton;
    lblIPGROUP: TLabel;
    edtInvestProgramGroupsName: TEdit;
    spbInvestProgramGroups: TSpeedButton;
    lblIPPURPOSEPROGRAM: TLabel;
    edtIPPURPOSEPROGRAM: TEdit;
    spbIPPURPOSEPROGRAM: TSpeedButton;
    HTTPRIOENInvestProgramGroups: THTTPRIO;
    HTTPRIOENIPPurposeProgram: THTTPRIO;
    HTTPRIOENMethodExecuteWork: THTTPRIO;
    gbIPItem : TGroupBox;
    pcIPItem : TPageControl;
    tsGeneral : TTabSheet;
    tsPlanWork : TTabSheet;
    alPlans: TActionList;
    actViewPlan: TAction;
    actAddPlan: TAction;
    actDeletePlan: TAction;
    actEditPlan: TAction;
    pmPlans: TPopupMenu;
    miViewPlan: TMenuItem;
    miEditPlan: TMenuItem;
    miDeletePlan: TMenuItem;
    miN1: TMenuItem;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton16: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    actUpdate: TAction;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENIPItem2Plan: THTTPRIO;
    tsTKMaterials: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    alMaterials: TActionList;
    actAddMaterials: TAction;
    actDeleteMaterials: TAction;
    sgTKMaterials: TAdvStringGrid;
    HTTPRIOENIPItem2TKMaterials: THTTPRIO;
    gbNKREInside: TGroupBox;
    lblCountGenInside: TLabel;
    lblPriceInside: TLabel;
    lblSumGenInside: TLabel;
    lblmm1countInside: TLabel;
    lblmm1sumInside: TLabel;
    lblmm2countInside: TLabel;
    lblmm2sumInside: TLabel;
    edtCountGenInside: TEdit;
    edtPriceInside: TEdit;
    edtSumGenInside: TEdit;
    edtmm1countInside: TEdit;
    edtmm1sumInside: TEdit;
    edtmm2countInside: TEdit;
    edtmm2sumInside: TEdit;
    lblmm3countInside: TLabel;
    lblmm3sumInside: TLabel;
    edtmm3countInside: TEdit;
    edtmm3sumInside: TEdit;
    lblmm4countInside: TLabel;
    lblmm4sumInside: TLabel;
    lblmm5countInside: TLabel;
    lblmm5sumInside: TLabel;
    edtmm4countInside: TEdit;
    edtmm4sumInside: TEdit;
    edtmm5countInside: TEdit;
    edtmm5sumInside: TEdit;
    lblmm6countInside: TLabel;
    lblmm6sumInside: TLabel;
    edtmm6countInside: TEdit;
    edtmm6sumInside: TEdit;
    lblmm7countInside: TLabel;
    lblmm7sumInside: TLabel;
    lblmm8countInside: TLabel;
    lblmm8sumInside: TLabel;
    edtmm7countInside: TEdit;
    edtmm7sumInside: TEdit;
    edtmm8countInside: TEdit;
    edtmm8sumInside: TEdit;
    lblmm9countInside: TLabel;
    lblmm9sumInside: TLabel;
    edtmm9countInside: TEdit;
    edtmm9sumInside: TEdit;
    lblmm10countInside: TLabel;
    lblmm10sumInside: TLabel;
    lblmm11countInside: TLabel;
    lblmm11sumInside: TLabel;
    edtmm10countInside: TEdit;
    edtmm10sumInside: TEdit;
    edtmm11countInside: TEdit;
    edtmm11sumInside: TEdit;
    lblmm12countInside: TLabel;
    lblmm12sumInside: TLabel;
    edtmm12countInside: TEdit;
    edtmm12sumInside: TEdit;
    btnEditInsideSum: TButton;
    lblIPImplementationType: TLabel;
    edtIPImplementationType: TEdit;
    spbIPImplementationType: TSpeedButton;
    HTTPRIOENIPImplementationType: THTTPRIO;
    grpInfoTenders: TGroupBox;
    edtInfoTenders: TMemo;
    btnInfoTenders: TButton;
    actEditIpimplementtype: TAction;
    miEditIpimplementtype: TMenuItem;
    btnInsertPlan: TToolButton;
    actInsertPlan: TAction;
    btnEditMaterials: TToolButton;
    actEditMaterials: TAction;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbTKMeasurementMeasurementClick(Sender : TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbFinancingClick(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
    procedure spblMethodExecuteworkClick(Sender: TObject);
    procedure spbInvestProgramGroupsClick(Sender: TObject);
    procedure spbIPPURPOSEPROGRAMClick(Sender: TObject);
    procedure edtSumGenChange(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actAddPlanExecute(Sender: TObject);
    procedure actDeletePlanExecute(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure pcIPItemChange(Sender: TObject);
    procedure pmPlansPopup(Sender: TObject);
    procedure actAddMaterialsExecute(Sender: TObject);
    procedure actDeleteMaterialsExecute(Sender: TObject);
    procedure edtPriceInsideChange(Sender: TObject);
    procedure btnEditInsideSumClick(Sender: TObject);
    procedure sgENPlanWorkTopLeftChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure spbIPImplementationTypeClick(Sender: TObject);
    procedure btnInfoTendersClick(Sender: TObject);
    procedure actEditIpimplementtypeExecute(Sender: TObject);
    procedure actInsertPlanExecute(Sender: TObject);
    procedure actEditMaterialsExecute(Sender: TObject);


  private
    { Private declarations }
    isEditingInsideSum : boolean;
    planFilter:  ENPlanWorkFilter;
    isEditinginfoTenders : boolean;
    InfoTenders : String;
  public
    { Public declarations }

end;

var
  frmENIPItemEdit: TfrmENIPItemEdit;
  ENIPItemObj: ENIPItem;
  EPRenList: EPRenShortList;

  //iColCount, iLastCount, ColCount, LastCount, LastRow : Integer;
  //iLastRow: Integer = 1;

  ENPlanWorkHeaders: array [1..18] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  TKMaterialsHeaders: array [1..4] of String =
        ( 'Код'
          ,'Од. виміру'
          ,'Матеріал'
          ,'Материал для подсчета кол-ва освоенных работ'
        );

implementation

uses
  ShowTKMeasurement
  ,TKMeasurementController
, ShowENElement, ENElementController, DMReportsUnit, ENConsts, ShowENEPRen,
  ShowENIPFinancing, ENMethodExecuteWorkController, ShowENMethodExecuteWork,
  ShowENInvestProgramGroups, ENInvestProgramGroupsController,
  ENIPItemStatusController, ShowENIPPurposeProgram,
  ENIPPurposeProgramController, ShowENIPImplementationType,
  ENIPImplementationTypeController, EditENIPItem2TKMaterials;

{uses
    EnergyproController, EnergyproController2, ENIPItemController  ;
}
{$R *.dfm}

var
  PlanColCount, PlanLastCount: Integer;
  PlanLastRow: Integer = 1;

procedure TfrmENIPItemEdit.FormShow(Sender: TObject);
var
  TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
  investProgramGroup: ENInvestProgramGroups;

  TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
  purposeProgram : ENIPPurposeProgram;

  TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
  methodExecuteWork : ENMethodExecuteWork;

  TempENIPImplementationType: ENIPImplementationTypeControllerSoapPort;
  ipImplementationTypeObj: ENIPImplementationType;
begin

  // не показываем планы временно
  // pcIPItem.Pages[1].TabVisible := false;

  isEditingInsideSum:= False;
  isEditinginfoTenders := False;
  btnEditInsideSum.Caption := 'Редагувати суми для фінансування';

  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);

  pcIPItem.ActivePage := tsGeneral;
  if (DialogState = dsInsert) then
  begin
    tsPlanWork.TabVisible := False;
    tsTKMaterials.TabVisible := False;
    HideControls([gbNKREInside , grpInfoTenders ]);
  end;

  DisableControls([edtEPRenName , edtTKMeasurementMeasurementName , edtCode ,
                   edtlMethodExecutework , edtInvestProgramGroupsName , edtIPPURPOSEPROGRAM,
                   edtIPImplementationType]);




   SetFloatStyle([
      edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum

      ,edtCountGenInside
      ,edtPriceInside
      ,edtSumGenInside
      ,edtmm1countInside
      ,edtmm1sumInside
      ,edtmm2countInside
      ,edtmm2sumInside
      ,edtmm3countInside
      ,edtmm3sumInside
      ,edtmm4countInside
      ,edtmm4sumInside
      ,edtmm5countInside
      ,edtmm5sumInside
      ,edtmm6countInside
      ,edtmm6sumInside
      ,edtmm7countInside
      ,edtmm7sumInside
      ,edtmm8countInside
      ,edtmm8sumInside
      ,edtmm9countInside
      ,edtmm9sumInside
      ,edtmm10countInside
      ,edtmm10sumInside
      ,edtmm11countInside
      ,edtmm11sumInside
      ,edtmm12countInside
      ,edtmm12sumInside

  ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
       edtTKMeasurementMeasurementName
      ,spbTKMeasurementMeasurement
      ,spbInvestProgramGroups
      ,spbIPPURPOSEPROGRAM
      ,spbENElement
      ,spbEPRen
      ,spbFinancing
      ,spblMethodExecutework
      ,spbIPImplementationType
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtItemNumber
      ,edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum

      ,edtCountGenInside
      ,edtPriceInside
      ,edtSumGenInside
      ,edtmm1countInside
      ,edtmm1sumInside
      ,edtmm2countInside
      ,edtmm2sumInside
      ,edtmm3countInside
      ,edtmm3sumInside
      ,edtmm4countInside
      ,edtmm4sumInside
      ,edtmm5countInside
      ,edtmm5sumInside
      ,edtmm6countInside
      ,edtmm6sumInside
      ,edtmm7countInside
      ,edtmm7sumInside
      ,edtmm8countInside
      ,edtmm8sumInside
      ,edtmm9countInside
      ,edtmm9sumInside
      ,edtmm10countInside
      ,edtmm10sumInside
      ,edtmm11countInside
      ,edtmm11sumInside
      ,edtmm12countInside
      ,edtmm12sumInside

     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    // отключим авто пересчет кол-ва и суммы год
    edtPrice.OnChange:= nil;
    edtQuarter1count.OnChange:= nil;
    edtQuarter2count.OnChange:= nil;
    edtQuarter3count.OnChange:= nil;
    edtQuarter4count.OnChange:= nil;

    // суммы по финансированию тоже
    edtPriceInside.OnChange:= nil;
    edtmm1countInside.OnChange:= nil;
    edtmm2countInside.OnChange:= nil;
    edtmm3countInside.OnChange:= nil;
    edtmm4countInside.OnChange:= nil;
    edtmm5countInside.OnChange:= nil;
    edtmm6countInside.OnChange:= nil;
    edtmm7countInside.OnChange:= nil;
    edtmm8countInside.OnChange:= nil;
    edtmm9countInside.OnChange:= nil;
    edtmm10countInside.OnChange:= nil;
    edtmm11countInside.OnChange:= nil;
    edtmm12countInside.OnChange:= nil;



    try



          edtCode.Text := IntToStr(ENIPItemObj.code);
          edtName.Text := ENIPItemObj.name;
          edtBuhName.Text:= ENIPItemObj.buhName;
          edtItemNumber.Text := ENIPItemObj.itemNumber;
          edtInvNumber.Text := ENIPItemObj.invNumber;

          if ( ENIPItemObj.isProjectDocument <> Low(Integer) ) then
            begin
            if ENIPItemObj.isProjectDocument = 1 then
               chkIsProjectDocument.Checked := True
            else
               chkIsProjectDocument.Checked := False;

            end
          else
             chkIsProjectDocument.Checked := False;

          edtFinancing.Text := ENIPItemObj.financing;
          MakeMultiline(edtCommentGen.Lines, ENIPItemObj.commentGen);
          if ( ENIPItemObj.countGen <> nil ) then
             edtCountGen.Text := ENIPItemObj.countGen.decimalString
          else
             edtCountGen.Text := '';
          if ( ENIPItemObj.price <> nil ) then
             edtPrice.Text := ENIPItemObj.price.decimalString
          else
             edtPrice.Text := '';
          if ( ENIPItemObj.sumGen <> nil ) then
             edtSumGen.Text := ENIPItemObj.sumGen.decimalString
          else
             edtSumGen.Text := '';
          if ( ENIPItemObj.quarter1count <> nil ) then
             edtQuarter1count.Text := ENIPItemObj.quarter1count.decimalString
          else
             edtQuarter1count.Text := '';
          if ( ENIPItemObj.quarter1sum <> nil ) then
             edtQuarter1sum.Text := ENIPItemObj.quarter1sum.decimalString
          else
             edtQuarter1sum.Text := '';
          if ( ENIPItemObj.quarter2count <> nil ) then
             edtQuarter2count.Text := ENIPItemObj.quarter2count.decimalString
          else
             edtQuarter2count.Text := '';
          if ( ENIPItemObj.quarter2sum <> nil ) then
             edtQuarter2sum.Text := ENIPItemObj.quarter2sum.decimalString
          else
             edtQuarter2sum.Text := '';
          if ( ENIPItemObj.quarter3count <> nil ) then
             edtQuarter3count.Text := ENIPItemObj.quarter3count.decimalString
          else
             edtQuarter3count.Text := '';
          if ( ENIPItemObj.quarter3sum <> nil ) then
             edtQuarter3sum.Text := ENIPItemObj.quarter3sum.decimalString
          else
             edtQuarter3sum.Text := '';
          if ( ENIPItemObj.quarter4count <> nil ) then
             edtQuarter4count.Text := ENIPItemObj.quarter4count.decimalString
          else
             edtQuarter4count.Text := '';
          if ( ENIPItemObj.quarter4sum <> nil ) then
             edtQuarter4sum.Text := ENIPItemObj.quarter4sum.decimalString
          else
             edtQuarter4sum.Text := '';


             if ( ENIPItemObj.countGenInside <> nil ) then
             edtCountGenInside.Text := ENIPItemObj.countGenInside.decimalString
          else
             edtCountGenInside.Text := '0';
          if ( ENIPItemObj.priceInside <> nil ) then
             edtPriceInside.Text := ENIPItemObj.priceInside.decimalString
          else
             edtPriceInside.Text := '0';
          if ( ENIPItemObj.sumGenInside <> nil ) then
             edtSumGenInside.Text := ENIPItemObj.sumGenInside.decimalString
          else
             edtSumGenInside.Text := '0';
          if ( ENIPItemObj.mm1countInside <> nil ) then
             edtmm1countInside.Text := ENIPItemObj.mm1countInside.decimalString
          else
             edtmm1countInside.Text := '0';
          if ( ENIPItemObj.mm1sumInside <> nil ) then
             edtmm1sumInside.Text := ENIPItemObj.mm1sumInside.decimalString
          else
             edtmm1sumInside.Text := '0';


          if ( ENIPItemObj.mm2countInside <> nil ) then
             edtmm2countInside.Text := ENIPItemObj.mm2countInside.decimalString
          else
             edtmm2countInside.Text := '0';
          if ( ENIPItemObj.mm2sumInside <> nil ) then
             edtmm2sumInside.Text := ENIPItemObj.mm2sumInside.decimalString
          else
             edtmm2sumInside.Text := '0';


          if ( ENIPItemObj.mm3countInside <> nil ) then
             edtmm3countInside.Text := ENIPItemObj.mm3countInside.decimalString
          else
             edtmm3countInside.Text := '0';
          if ( ENIPItemObj.mm3sumInside <> nil ) then
             edtmm3sumInside.Text := ENIPItemObj.mm3sumInside.decimalString
          else
             edtmm3sumInside.Text := '0';
    


          if ( ENIPItemObj.mm4countInside <> nil ) then
             edtmm4countInside.Text := ENIPItemObj.mm4countInside.decimalString
          else
             edtmm4countInside.Text := '0';
          if ( ENIPItemObj.mm4sumInside <> nil ) then
             edtmm4sumInside.Text := ENIPItemObj.mm4sumInside.decimalString
          else
             edtmm4sumInside.Text := '0';


          if ( ENIPItemObj.mm5countInside <> nil ) then
             edtmm5countInside.Text := ENIPItemObj.mm5countInside.decimalString
          else
             edtmm5countInside.Text := '0';
          if ( ENIPItemObj.mm5sumInside <> nil ) then
             edtmm5sumInside.Text := ENIPItemObj.mm5sumInside.decimalString
          else
             edtmm5sumInside.Text := '0';


          if ( ENIPItemObj.mm6countInside <> nil ) then
             edtmm6countInside.Text := ENIPItemObj.mm6countInside.decimalString
          else
             edtmm6countInside.Text := '0';
          if ( ENIPItemObj.mm6sumInside <> nil ) then
             edtmm6sumInside.Text := ENIPItemObj.mm6sumInside.decimalString
          else
             edtmm6sumInside.Text := '0';

          if ( ENIPItemObj.mm7countInside <> nil ) then
             edtmm7countInside.Text := ENIPItemObj.mm7countInside.decimalString
          else
             edtmm7countInside.Text := '0';
          if ( ENIPItemObj.mm7sumInside <> nil ) then
             edtmm7sumInside.Text := ENIPItemObj.mm7sumInside.decimalString
          else
             edtmm7sumInside.Text := '0';


          if ( ENIPItemObj.mm8countInside <> nil ) then
             edtmm8countInside.Text := ENIPItemObj.mm8countInside.decimalString
          else
             edtmm8countInside.Text := '0';
          if ( ENIPItemObj.mm8sumInside <> nil ) then
             edtmm8sumInside.Text := ENIPItemObj.mm8sumInside.decimalString
          else
             edtmm8sumInside.Text := '0';


          if ( ENIPItemObj.mm9countInside <> nil ) then
             edtmm9countInside.Text := ENIPItemObj.mm9countInside.decimalString
          else
             edtmm9countInside.Text := '0';
          if ( ENIPItemObj.mm9sumInside <> nil ) then
             edtmm9sumInside.Text := ENIPItemObj.mm9sumInside.decimalString
          else
             edtmm9sumInside.Text := '0';


          if ( ENIPItemObj.mm10countInside <> nil ) then
             edtmm10countInside.Text := ENIPItemObj.mm10countInside.decimalString
          else
             edtmm10countInside.Text := '0';
          if ( ENIPItemObj.mm10sumInside <> nil ) then
             edtmm10sumInside.Text := ENIPItemObj.mm10sumInside.decimalString
          else
             edtmm10sumInside.Text := '0';


          if ( ENIPItemObj.mm11countInside <> nil ) then
             edtmm11countInside.Text := ENIPItemObj.mm11countInside.decimalString
          else
             edtmm11countInside.Text := '0';
          if ( ENIPItemObj.mm11sumInside <> nil ) then
             edtmm11sumInside.Text := ENIPItemObj.mm11sumInside.decimalString
          else
             edtmm11sumInside.Text := '0';


          if ( ENIPItemObj.mm12countInside <> nil ) then
             edtmm12countInside.Text := ENIPItemObj.mm12countInside.decimalString
          else
             edtmm12countInside.Text := '0';
          if ( ENIPItemObj.mm12sumInside <> nil ) then
             edtmm12sumInside.Text := ENIPItemObj.mm12sumInside.decimalString
          else
             edtmm12sumInside.Text := '0';

          edtTKMeasurementMeasurementName.Text := ENIPItemObj.measurement.name;

          //    --------

          edtEPRenName.Text :=  ENIPItemObj.renRef.name;

          MakeMultiline(edtInfoTenders.Lines, ENIPItemObj.infoTenders);
          InfoTenders   := ENIPItemObj.infoTenders;


          if ENIPItemObj.invGroupRef <> nil then
            if ENIPItemObj.invGroupRef.code > LOW_INT then
            begin
              TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
              investProgramGroup := TempENInvestProgramGroups.getObject(ENIPItemObj.invGroupRef.code);
              if investProgramGroup <> nil then
                edtInvestProgramGroupsName.Text := investProgramGroup.name + '. ' + investProgramGroup.commentgen;
            end;

          if ENIPItemObj.purposeProgramRef <> nil then
            if ENIPItemObj.purposeProgramRef.code > LOW_INT then
            begin
              TempENIPPurposeProgram := HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;
              purposeProgram := TempENIPPurposeProgram.getObject(ENIPItemObj.purposeProgramRef.code);
              if purposeProgram <> nil then
                edtIPPURPOSEPROGRAM.Text := purposeProgram.name;
            end;

          if ENIPItemObj.purposeProgramRef <> nil then
            if ENIPItemObj.purposeProgramRef.code > LOW_INT then
            begin
              TempENMethodExecuteWork := HTTPRIOENMethodExecuteWork as ENMethodExecuteWorkControllerSoapPort;
              methodExecuteWork := TempENMethodExecuteWork.getObject(ENIPItemObj.methodExecWorkRef.code);
              if methodExecuteWork <> nil then
                edtlMethodExecutework.Text := methodExecuteWork.name;
            end;

          if ENIPItemObj.ipImplementTypeRef <> nil then
            if ENIPItemObj.ipImplementTypeRef.code <> LOW_INT then
            begin
              TempENIPImplementationType := HTTPRIOENIPImplementationType as ENIPImplementationTypeControllerSoapPort;
              ipImplementationTypeObj := TempENIPImplementationType.getObject(ENIPItemObj.ipImplementTypeRef.code);

              if ipImplementationTypeObj <> nil then
                edtIPImplementationType.Text := ipImplementationTypeObj.name;
            end;

       finally

          // вернем обработчик на onChange
         edtPrice.OnChange:= edtPriceChange;
         edtQuarter1count.OnChange:= edtPriceChange;
         edtQuarter2count.OnChange:= edtPriceChange;
         edtQuarter3count.OnChange:= edtPriceChange;
         edtQuarter4count.OnChange:= edtPriceChange;


         // суммы по финансированию тоже
        edtPriceInside.OnChange:= edtPriceInsideChange;
        edtmm1countInside.OnChange:= edtPriceInsideChange;
        edtmm2countInside.OnChange:= edtPriceInsideChange;
        edtmm3countInside.OnChange:= edtPriceInsideChange;
        edtmm4countInside.OnChange:= edtPriceInsideChange;
        edtmm5countInside.OnChange:= edtPriceInsideChange;
        edtmm6countInside.OnChange:= edtPriceInsideChange;
        edtmm7countInside.OnChange:= edtPriceInsideChange;
        edtmm8countInside.OnChange:= edtPriceInsideChange;
        edtmm9countInside.OnChange:= edtPriceInsideChange;
        edtmm10countInside.OnChange:= edtPriceInsideChange;
        edtmm11countInside.OnChange:= edtPriceInsideChange;
        edtmm12countInside.OnChange:= edtPriceInsideChange;


       end;

  end;

        DisableControls([edtPriceInside , edtCountGenInside , edtSumGenInside
        , edtmm1countInside
        , edtmm1sumInside
        , edtmm2countInside
        , edtmm2sumInside
        , edtmm3countInside
        , edtmm3sumInside
        , edtmm4countInside
        , edtmm4sumInside
        , edtmm5countInside
        , edtmm5sumInside
        , edtmm6countInside
        , edtmm6sumInside
        , edtmm7countInside
        , edtmm7sumInside
        , edtmm8countInside
        , edtmm8sumInside
        , edtmm9countInside
        , edtmm9sumInside
        , edtmm10countInside
        , edtmm10sumInside
        , edtmm11countInside
        , edtmm11sumInside
        , edtmm12countInside
        , edtmm12sumInside


        ]);


        DisableControls([edtInfoTenders]);

end;


procedure TfrmENIPItemEdit.pcIPItemChange(Sender: TObject);
var
  i, n, LastCount: Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  //planFilter:  ENPlanWorkFilter;
  ENPlanWorkList : ENPlanWorkShortList;
  strPlanCodes : string;
  TempENIPItem2TKMaterials : ENIPItem2TKMaterialsControllerSoapPort;
  ENIPItem2TKMaterialsList : ENIPItem2TKMaterialsShortList;
  ipItem2MaterialsFilter : ENIPItem2TKMaterialsFilter;
begin
  inherited;

  if ENIPItemObj = nil then Exit;
  if ENIPItemObj.code = LOW_INT then Exit;

  if pcIPItem.ActivePage = tsPlanWork then
  begin
    ClearGrid(sgENPlanWork);

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    //strPlanCodes := DMReports.getStrCodePlanFromIPItem(ENIPItemObj.code);
    //planFilter.conditionSQL := 'enplanwork.code in (' + strPlanCodes + ')';

    // planFilter.conditionSQL := 'enplanwork.code in (select i2p.planrefcode from enipitem2plan i2p where i2p.ipitemrefcode = ' +
    // IntToStr(ENIPItemObj.code) + ')';


    planFilter.conditionSQL := ' enipitem2plan.ipitemrefcode = ' + IntToStr(ENIPItemObj.code);

    PlanColCount := 100;

    //planFilter.conditionSQL := 'enplanwork.code in (select p.planrefcode from enipitem2plan p ' +
	  //    ' where p.planrefcode = enplanwork.code and p.ipitemrefcode = ' + IntToStr(ENIPItemObj.code) + ')';

    //ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
    //ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, PlanColCount);
    ENPlanWorkList := TempENPlanWork.getScrollableFilteredListIPitem2plan(planFilter, 0, PlanColCount);

    PlanLastCount := High(ENPlanWorkList.list);

    if PlanLastCount > -1 then
      sgENPlanWork.RowCount := PlanLastCount + 2
    else
      sgENPlanWork.RowCount := 2;

    with sgENPlanWork do
      for i := 0 to PlanLastCount do
        begin
          Application.ProcessMessages;

          n := 0;

          if ENPlanWorkList.list[i].code <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code)
          else
            Cells[n,i+1] := '';
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
          inc(n);

          if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
            Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].dateStart = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
          inc(n);


          Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
          inc(n);

          Cells[n,i+1] := '';

          if ENPlanWorkList.list[i].yearOriginal > 0 then
          begin
            if ENPlanWorkList.list[i].monthOriginal > 0 then
              Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                              IntToStr(ENPlanWorkList.list[i].yearOriginal);
          end
          else
            Cells[n,i+1] := '';
          inc(n);
          /////

          Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
          inc(n);

          if ENPlanWorkList.list[i].dateEdit = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
          inc(n);

          PlanLastRow := i + 1;

          sgENPlanWork.RowCount := i + 2;
        end;

     PlanColCount := PlanColCount + 1;
     sgENPlanWork.Row := 1;
  end;

  if pcIPItem.ActivePage = tsTKMaterials then
  begin
    ClearGrid(sgTKMaterials);
    TempENIPItem2TKMaterials := HTTPRIOENIPItem2TKMaterials as ENIPItem2TKMaterialsControllerSoapPort;

    ipItem2MaterialsFilter := ENIPItem2TKMaterialsFilter.Create;
    SetNullIntProps(ipItem2MaterialsFilter);
    SetNullXSProps(ipItem2MaterialsFilter);
    ipItem2MaterialsFilter.ipItemRef := ENIPItemRef.Create;
    ipItem2MaterialsFilter.ipItemRef.code := ENIPItemObj.code;

    ENIPItem2TKMaterialsList := TempENIPItem2TKMaterials.getScrollableFilteredList(ipItem2MaterialsFilter,0,-1);

    LastCount := High(ENIPItem2TKMaterialsList.list);

    if LastCount > -1 then
      sgTKMaterials.RowCount := LastCount + 2
    else
      sgTKMaterials.RowCount := 2;

    with sgTKMaterials do
      for i := 0 to LastCount do
        begin
          Application.ProcessMessages;

          if ENIPItem2TKMaterialsList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENIPItem2TKMaterialsList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENIPItem2TKMaterialsList.list[i].materialMasurement;
          Cells[2,i+1] := ENIPItem2TKMaterialsList.list[i].materialRefName;
          if ENIPItem2TKMaterialsList.list[i].isMaterialForCount > 0 then
          Cells[3,i+1] := 'Да'
          else
          Cells[3,i+1] := 'Нет';

          sgTKMaterials.RowCount := i + 2;
        end;
     sgTKMaterials.Row := 1;
  end;

end;


procedure TfrmENIPItemEdit.pmPlansPopup(Sender: TObject);
var
  ObjCode : Integer;
  plan : ENPlanWork;
  allowCloseUnclose : Boolean;
begin
  inherited;

  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  plan := DMReports.getPlanByCode(ObjCode);
  if plan = nil then
  begin
    Exit;
  end;

end;


procedure TfrmENIPItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPItem: ENIPItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtItemNumber
      ,edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
      ,edtIPPURPOSEPROGRAM
      ,edtTKMeasurementMeasurementName
      ,edtlMethodExecutework
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

//    if edtEPRenName.text = '' then
//     begin
//      Application.MessageBox(PChar('Не вказаний Підрозділ!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
//      Action:=caNone;
//      Exit;
//     end ;


    TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;


     ENIPItemObj.name := edtName.Text;

     ENIPItemObj.buhName := edtBuhName.Text; 

     ENIPItemObj.itemNumber := edtItemNumber.Text; 

     ENIPItemObj.invNumber := edtInvNumber.Text; 

     if ( chkIsProjectDocument.Checked ) then
       ENIPItemObj.isProjectDocument := ENIPITEM_ISPROJECTDOCUMENT_TRUE
     else
       ENIPItemObj.isProjectDocument := ENIPITEM_ISPROJECTDOCUMENT_FALSE ;

     ENIPItemObj.financing := edtFinancing.Text;

     ENIPItemObj.commentGen := edtCommentGen.Text; 

     if (ENIPItemObj.countGen = nil ) then
       ENIPItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENIPItemObj.countGen.decimalString := edtCountGen.Text 
     else
       ENIPItemObj.countGen := nil;

     if (ENIPItemObj.price = nil ) then
       ENIPItemObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENIPItemObj.price.decimalString := edtPrice.Text 
     else
       ENIPItemObj.price := nil;

     if (ENIPItemObj.sumGen = nil ) then
       ENIPItemObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENIPItemObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENIPItemObj.sumGen := nil;

     if (ENIPItemObj.quarter1count = nil ) then
       ENIPItemObj.quarter1count := TXSDecimal.Create;
     if edtQuarter1count.Text <> '' then
       ENIPItemObj.quarter1count.decimalString := edtQuarter1count.Text 
     else
       ENIPItemObj.quarter1count := nil;

     if (ENIPItemObj.quarter1sum = nil ) then
       ENIPItemObj.quarter1sum := TXSDecimal.Create;
     if edtQuarter1sum.Text <> '' then
       ENIPItemObj.quarter1sum.decimalString := edtQuarter1sum.Text 
     else
       ENIPItemObj.quarter1sum := nil;

     if (ENIPItemObj.quarter2count = nil ) then
       ENIPItemObj.quarter2count := TXSDecimal.Create;
     if edtQuarter2count.Text <> '' then
       ENIPItemObj.quarter2count.decimalString := edtQuarter2count.Text 
     else
       ENIPItemObj.quarter2count := nil;

     if (ENIPItemObj.quarter2sum = nil ) then
       ENIPItemObj.quarter2sum := TXSDecimal.Create;
     if edtQuarter2sum.Text <> '' then
       ENIPItemObj.quarter2sum.decimalString := edtQuarter2sum.Text 
     else
       ENIPItemObj.quarter2sum := nil;

     if (ENIPItemObj.quarter3count = nil ) then
       ENIPItemObj.quarter3count := TXSDecimal.Create;
     if edtQuarter3count.Text <> '' then
       ENIPItemObj.quarter3count.decimalString := edtQuarter3count.Text 
     else
       ENIPItemObj.quarter3count := nil;

     if (ENIPItemObj.quarter3sum = nil ) then
       ENIPItemObj.quarter3sum := TXSDecimal.Create;
     if edtQuarter3sum.Text <> '' then
       ENIPItemObj.quarter3sum.decimalString := edtQuarter3sum.Text 
     else
       ENIPItemObj.quarter3sum := nil;

     if (ENIPItemObj.quarter4count = nil ) then
       ENIPItemObj.quarter4count := TXSDecimal.Create;
     if edtQuarter4count.Text <> '' then
       ENIPItemObj.quarter4count.decimalString := edtQuarter4count.Text 
     else
       ENIPItemObj.quarter4count := nil;

     if (ENIPItemObj.quarter4sum = nil ) then
       ENIPItemObj.quarter4sum := TXSDecimal.Create;
     if edtQuarter4sum.Text <> '' then
       ENIPItemObj.quarter4sum.decimalString := edtQuarter4sum.Text 
     else
       ENIPItemObj.quarter4sum := nil;







    if DialogState = dsInsert then
    begin
      ENIPItemObj.code:=low(Integer);
      ENIPItemObj.statusRef := ENIPItemStatusRef.Create;
      ENIPItemObj.statusRef.code := ENConsts.ENIPSTATUS_DRAFT;
      TempENIPItem.add(ENIPItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIPItem.save(ENIPItemObj);
    end;
  end;
end;


procedure TfrmENIPItemEdit.FormCreate(Sender: TObject);
begin
  planFilter := nil;
end;

procedure TfrmENIPItemEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(planFilter) then
    planFilter.Free;

  inherited;
end;

procedure TfrmENIPItemEdit.sgENPlanWorkTopLeftChanged(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  i, n, CurrentRow: Integer;
  ENPlanWorkList : ENPlanWorkShortList;
begin
  if PlanLastCount < 99 then Exit;

  if (sgENPlanWork.TopRow + sgENPlanWork.VisibleRowCount) = PlanColCount then
  begin
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    CurrentRow := sgENPlanWork.RowCount;

//     ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, PlanColCount - 1, 100);
    ENPlanWorkList := TempENPlanWork.getScrollableFilteredListIPitem2plan(planFilter, PlanColCount - 1, 100);

    sgENPlanWork.RowCount := sgENPlanWork.RowCount + 100;

    PlanLastCount := High(ENPlanWorkList.list);

    with sgENPlanWork do
      for i := 0 to PlanLastCount do
      begin
        Application.ProcessMessages;

        n := 0;

        if ENPlanWorkList.list[i].code <> Low(Integer) then
          Cells[n, i + CurrentRow] := IntToStr(ENPlanWorkList.list[i].code)
        else
          Cells[n, i + CurrentRow] := '';
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].objectName;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].invNumber;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].renRefName;
        inc(n);

        if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
          Cells[n, i + CurrentRow] := IntToStr(ENPlanWorkList.list[i].yearGen)
        else
          Cells[n, i + CurrentRow] := '';
        inc(n);

        if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
          Cells[n, i + CurrentRow] := MonthesNames[ENPlanWorkList.list[i].monthGen]
        else
          Cells[n, i + CurrentRow] := '';
        inc(n);

        if ENPlanWorkList.list[i].dateStart = nil then
          Cells[n, i + CurrentRow] := ''
        else
          Cells[n, i + CurrentRow] := XSDate2String(ENPlanWorkList.list[i].dateStart);
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].typeRefName;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].stateRefShortName;
        inc(n);


        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].kindName ;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].statusName;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].departmentRefShortName;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].budgetRefShortName;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].responsibilityRefShortName;
        inc(n);

        Cells[n, i + CurrentRow] := '';

        if ENPlanWorkList.list[i].yearOriginal > 0 then
        begin
          if ENPlanWorkList.list[i].monthOriginal > 0 then
            Cells[n, i + CurrentRow] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                            IntToStr(ENPlanWorkList.list[i].yearOriginal);
        end
        else
          Cells[n, i + CurrentRow] := '';
        inc(n);
        /////

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].workOrderNumber;
        inc(n);

        Cells[n, i + CurrentRow] := ENPlanWorkList.list[i].userGen;
        inc(n);

        if ENPlanWorkList.list[i].dateEdit = nil then
          Cells[n, i + CurrentRow] := ''
        else
          Cells[n, i + CurrentRow] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
        inc(n);

        PlanLastRow := i + CurrentRow;

        //sgENPlanWork.RowCount := i + 2;
      end;

     PlanColCount := PlanColCount + 100;
     sgENPlanWork.Row := CurrentRow - 5;
     sgENPlanWork.RowCount := PlanLastRow + 1;
  end;
end;

procedure TfrmENIPItemEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);

  try
    DisableActions([frmENElementShow.actInsert, frmENElementShow.actEdit, frmENElementShow.actDelete]);

    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          edtName.Text := GetReturnValue(sgENElement, 1);
          edtInvNumber.Text := GetReturnValue(sgENElement, 3);
          edtBuhName.Text := GetReturnValue(sgENElement, 5);

          EPRenList := DMReports.getEPRenShortList( StrToInt(GetReturnValue(sgENElement, 0) ) );

          if ENIPItemObj.renRef = nil then  ENIPItemObj.renRef :=  EPRenRef.Create();
          ENIPItemObj.renRef.code :=  EPRenList.list[0].code;
          ENIPItemObj.renRef.name :=  EPRenList.list[0].name;


          edtEPRenName.Text :=  EPRenList.list[0].name;

        except
          on EConvertError do Exit;
        end;
      end;
   finally
     frmENElementShow.Free;
   end;
end;

procedure TfrmENIPItemEdit.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               if ENIPItemObj.renRef = nil then  ENIPItemObj.renRef :=  EPRenRef.Create();

               ENIPItemObj.renRef.code :=  StrToInt(GetReturnValue(sgEPRen,0));
               ENIPItemObj.renRef.name :=  GetReturnValue(sgEPRen,1);
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmENIPItemEdit.spbFinancingClick(Sender: TObject);
var
   frmenipfinancingShow : TfrmenipfinancingShow;
begin
   frmenipfinancingShow:=TfrmenipfinancingShow.Create(Application,fmNormal);
   try
      with frmenipfinancingShow do
        if ShowModal = mrOk then
        begin
            try
               edtFinancing.Text :=GetReturnValue(sgENIPFinancing,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmenipfinancingShow.Free;
   end;
end;

procedure TfrmENIPItemEdit.spbInvestProgramGroupsClick(Sender: TObject);
var
   frmENInvestProgramGroupsShow: TfrmENInvestProgramGroupsShow;

begin


   frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal);
   try
     DisableActions([frmENInvestProgramGroupsShow.actInsert, frmENInvestProgramGroupsShow.actEdit, frmENInvestProgramGroupsShow.actDelete]);

     with frmENInvestProgramGroupsShow do
     begin
       if ShowModal = mrOk then
       begin
         try

           if ENIPItemObj.invGroupRef = nil then ENIPItemObj.invGroupRef := ENInvestProgramGroupsRef.Create();
           ENIPItemObj.invGroupRef.code := StrToInt(GetReturnValue(sgENInvestProgramGroups, 0));
           edtInvestProgramGroupsName.Text := GetReturnValue(sgENInvestProgramGroups, 1) + '. ' +
                                              GetReturnValue(sgENInvestProgramGroups, 2);
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmENInvestProgramGroupsShow.Free;
   end;
end;

procedure TfrmENIPItemEdit.spbIPImplementationTypeClick(Sender: TObject);
var frmENIPImplementationTypeShow: TfrmENIPImplementationTypeShow;
begin
  frmENIPImplementationTypeShow := TfrmENIPImplementationTypeShow.Create(Application, fmNormal);
  try
    frmENIPImplementationTypeShow.DisableActions([frmENIPImplementationTypeShow.actInsert,
                                                  frmENIPImplementationTypeShow.actEdit,
                                                  frmENIPImplementationTypeShow.actDelete]);
    with frmENIPImplementationTypeShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          if ENIPItemObj.ipImplementTypeRef = nil then ENIPItemObj.ipImplementTypeRef := ENIPImplementationTypeRef.Create();
          ENIPItemObj.ipImplementTypeRef.code := StrToInt(GetReturnValue(sgENIPImplementationType, 0));
          edtIPImplementationType.Text := GetReturnValue(sgENIPImplementationType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENIPImplementationTypeShow.Free;
  end;
end;

procedure TfrmENIPItemEdit.spbIPPURPOSEPROGRAMClick(Sender: TObject);
var
//  MethodExecuteWorkShow : TfrmENMethodExecuteWorkShow;
  ENIppurposeprogramShow    :   TfrmENIppurposeprogramShow;
begin
   ENIppurposeprogramShow:=TfrmENIppurposeprogramShow.Create(Application,fmNormal);
   try
      with ENIppurposeprogramShow do
        if ShowModal = mrOk then
        begin
            try
               edtIPPURPOSEPROGRAM.Text :=GetReturnValue(sgENIPPurposeProgram,1);
               ENIPItemObj.purposeProgramRef := ENIPPurposeProgramRef.Create;
               ENIPItemObj.purposeProgramRef.code := StrToInt(GetReturnValue(sgENIPPurposeProgram,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      ENIppurposeprogramShow.Free;
   end;
end;

procedure TfrmENIPItemEdit.spblMethodExecuteworkClick(Sender: TObject);
var
  MethodExecuteWorkShow : TfrmENMethodExecuteWorkShow;
begin
   MethodExecuteWorkShow:=TfrmENMethodExecuteWorkShow.Create(Application,fmNormal);
   try
      with MethodExecuteWorkShow do
        if ShowModal = mrOk then
        begin
            try
               edtlMethodExecutework.Text :=GetReturnValue(sgENMethodExecuteWork,1);
               ENIPItemObj.methodExecWorkRef := ENMethodExecuteWorkRef.Create;
               ENIPItemObj.methodExecWorkRef.code := StrToInt(GetReturnValue(sgENMethodExecuteWork,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      MethodExecuteWorkShow.Free;
   end;
end;

procedure TfrmENIPItemEdit.spbTKMeasurementMeasurementClick(Sender : TObject);
var 
   frmTKMeasurementShow: TfrmTKMeasurementShow;
begin
   frmTKMeasurementShow:=TfrmTKMeasurementShow.Create(Application,fmNormal);
   try
      with frmTKMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENIPItemObj.measurement = nil then ENIPItemObj.measurement := TKMeasurement.Create();
               if not DMReports.UsesMDAXData(CONFIG_USES_MDAX_ITEM) then
                 ENIPItemObj.measurement.code := StrToInt(GetReturnValue(sgTKMeasurement,0))
               else
                 ENIPItemObj.measurement.name := GetReturnValue(sgTKMeasurement,1);
               edtTKMeasurementMeasurementName.Text:=GetReturnValue(sgTKMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMeasurementShow.Free;
   end;
end;


procedure TfrmENIPItemEdit.actDeleteMaterialsExecute(Sender: TObject);
var
  TempENIPItem2TKMaterials : ENIPItem2TKMaterialsControllerSoapPort;
  ObjCode : Integer;
begin
  TempENIPItem2TKMaterials := HTTPRIOENIPItem2TKMaterials as ENIPItem2TKMaterialsControllerSoapPort;
  try
    ObjCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить материал из данного пункта?'),
    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENIPItem2TKMaterials.remove(ObjCode);
    actUpdateExecute(Sender);
  end;
end;


procedure TfrmENIPItemEdit.actDeletePlanExecute(Sender: TObject);
var
  planCode, ip2PlanCode : Integer;
  TempENIPItem2Plan : ENIPItem2PlanControllerSoapPort;
begin
  inherited;
  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить план из пункта инвестпрограммы?'),
      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENIPItem2Plan := HTTPRIOENIPItem2Plan as ENIPItem2PlanControllerSoapPort;
    ip2PlanCode := DMReports.getIp2PlanCodeByPlanCode(planCode, ENIPItemObj.code);
    TempENIPItem2Plan.remove(ip2PlanCode);
  end;

  actUpdateExecute(Sender);
end;


procedure TfrmENIPItemEdit.actEditIpimplementtypeExecute(Sender: TObject);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  objPlanCode , IPImplementationTypeCode: Integer;
  frmENIPImplementationTypeShow: TfrmENIPImplementationTypeShow;

begin
  inherited;
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  objPlanCode:=-1;
  IPImplementationTypeCode:=-1;
  try
    objPlanCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  frmENIPImplementationTypeShow := TfrmENIPImplementationTypeShow.Create(Application, fmNormal);
  try
    frmENIPImplementationTypeShow.DisableActions([frmENIPImplementationTypeShow.actInsert,
                                                  frmENIPImplementationTypeShow.actEdit,
                                                  frmENIPImplementationTypeShow.actDelete]);
    with frmENIPImplementationTypeShow do
    begin
      if ShowModal = mrOk then
      begin
        try

          IPImplementationTypeCode:= StrToInt(GetReturnValue(sgENIPImplementationType, 0));

        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENIPImplementationTypeShow.Free;
  end;

  if  ((objPlanCode<> -1) and  (IPImplementationTypeCode <> -1 )) then
     TempENPlanWork.editENIPImplementationType(objPlanCode,IPImplementationTypeCode );


end;

procedure TfrmENIPItemEdit.actEditMaterialsExecute(Sender: TObject);
var
  TempENIPItem2TKMaterials: ENIPItem2TKMaterialsControllerSoapPort;
begin
  TempENIPItem2TKMaterials := HTTPRIOENIPItem2TKMaterials as ENIPItem2TKMaterialsControllerSoapPort;
  try
    ENIPItem2TKMaterialsObj := TempENIPItem2TKMaterials.getObject(StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENIPItem2TKMaterialsEdit:=TfrmENIPItem2TKMaterialsEdit.Create(Application, dsEdit);

  try
    if frmENIPItem2TKMaterialsEdit.ShowModal= mrOk then
      begin

        pcIPItemChange(Sender);
      end;
  finally
    frmENIPItem2TKMaterialsEdit.Free;
    frmENIPItem2TKMaterialsEdit:=nil;
  end;

end;

procedure TfrmENIPItemEdit.actEditPlanExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
begin
  inherited;
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);
  if tPlan = nil then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED) then
  begin
    try
      TempENPlanWork.editPreConfirm(tPlan.code);
    except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  then
  begin
    Application.MessageBox(PChar('План затверджений!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (tPlan.kind.code = ENPLANWORKKIND_CALCULATION) then
  begin
    Application.MessageBox(PChar('Кошторис не редагується!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(ObjCode);

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENIPItemEdit.actInsertPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
codePlan : Integer;
ipItem2Plan : ENIPItem2Plan;
TempENIPItem2Plan : ENIPItem2PlanControllerSoapPort;
ENIPItem2PlanCode : Integer;

begin
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  codePlan := LOW_INT;
  ENIPItem2PlanCode := LOW_INT;

  try
    frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsInsert);
    try

      frmENPlanWorkEdit.ENPlanWorkObj:=ENPlanWork.Create;
      SetNullIntProps(frmENPlanWorkEdit.ENPlanWorkObj);
      SetNullXSProps(frmENPlanWorkEdit.ENPlanWorkObj);

      //frmENPlanWorkEdit.ENPlanWorkObj.dateGen:= TXSDate.Create;
      //frmENPlanWorkEdit.ENPlanWorkObj.dateEdit:= TXSDate.Create;

      //frmENPlanWorkEdit.ENPlanWorkObj.kind := ENPlanWorkKind.Create;
      //frmENPlanWorkEdit.ENPlanWorkObj.kind.code := ENPLANWORKKIND_YEAR;
      frmENPlanWorkEdit.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_YEAR - 1;

      if frmENPlanWorkEdit.ShowModal = mrOk then
      begin
           codePlan := frmENPlanWorkEdit.ENPlanWorkObj.code;
           /// создать связку пункта ип с планом с проверкой что бы не завели ничего другого кроме ИП
           if codePlan <> LOW_INT then
           begin
             try
              TempENIPItem2Plan := HTTPRIOENIPItem2Plan as ENIPItem2PlanControllerSoapPort;
              ipItem2Plan := ENIPItem2Plan.Create;
              ipItem2Plan.planRef := ENPlanWorkRef.Create;
              ipItem2Plan.planRef.code := codePlan;
              ipItem2Plan.ipItemRef := ENIPItemRef.Create;
              ipItem2Plan.ipItemRef.code := ENIPItemObj.code;

              // создание связки пункта ИП с планом который только что создан
              ENIPItem2PlanCode := TempENIPItem2Plan.addWithNewPlan(ipItem2Plan);

              if ENIPItem2PlanCode = LOW_INT then
              begin
                TempENPlanWork.remove(codePlan);
                Application.MessageBox(PChar('План не создан !!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                pcIPItemChange(Sender);
              end;

             except

                // Application.MessageBox(PChar('План не создан !!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                on E : Exception do
                begin
                 TempENPlanWork.remove(codePlan);
                 ShowMessage('План не создан!!! '+E.Message);

                 pcIPItemChange(Sender);
                end;
             end;
           end;
           pcIPItemChange(Sender);
      end;


    finally
      frmENPlanWorkEdit.Free;
      frmENPlanWorkEdit:=nil;
    end;
  finally
    //ENPlanWorkObj.Free;
  end;
end;

procedure TfrmENIPItemEdit.actAddMaterialsExecute(Sender: TObject);
var
  frmSpr_matherialShow: TfrmTKMaterialsShow;
  mtFilter : TKMaterialsFilter;
  TempENIPItem2TKMaterials : ENIPItem2TKMaterialsControllerSoapPort;
  ipItem2Materials : ENIPItem2TKMaterials;
begin
  inherited;

  try
    frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);

    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        TempENIPItem2TKMaterials := HTTPRIOENIPItem2TKMaterials as ENIPItem2TKMaterialsControllerSoapPort;

        ipItem2Materials := ENIPItem2TKMaterials.Create;
        ipItem2Materials.materialRef := TKMaterialsRef.Create;
        ipItem2Materials.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
        ipItem2Materials.ipItemRef := ENIPItemRef.Create;
        ipItem2Materials.ipItemRef.code := ENIPItemObj.code;

        TempENIPItem2TKMaterials.add(ipItem2Materials);
      end;
    end;

    actUpdateExecute(Sender);
  finally
    frmSpr_matherialShow.Free;
  end;
end;


procedure TfrmENIPItemEdit.actAddPlanExecute(Sender: TObject);
var
  TempENIPItem2Plan : ENIPItem2PlanControllerSoapPort;
  ipItem2Plan : ENIPItem2Plan;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  planFilter : ENPlanWorkFilter;
  plan : ENPlanWork;
  frmENPlanWorkShow : TfrmENPlanWorkShow;
  year : string;
begin
  inherited;

  year := FormatDateTime('yyyy', Now);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  planFilter.conditionSQL := 'enplanwork.yeargen = ' + year + ' and enplanwork.statuscode = 3 ' +
    ' and enplanwork.kindcode in (1, 2) and enplanwork.typerefcode in (5, 20, 100, 106, 111, 112) ';
  planFilter.orderBySQL := 'enplanwork.typerefcode';

  try
    frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);

    DisableActions([frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actDelete,
        frmENPlanWorkShow.actNoFilter, frmENPlanWorkShow.actAddPlanItems]);

    frmENPlanWorkShow.sgENPlanWork.PopupMenu := nil;
    frmENPlanWorkShow.viewPlanWork := 1;
    frmENPlanWorkShow.isFiltered := True;

    if frmENPlanWorkShow.ShowModal = mrOk then
    begin
      plan := TempENPlanWork.getObject(StrToInt(frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,0)));
      if (plan <> nil) then begin
        TempENIPItem2Plan := HTTPRIOENIPItem2Plan as ENIPItem2PlanControllerSoapPort;
        ipItem2Plan := ENIPItem2Plan.Create;
        ipItem2Plan.planRef := ENPlanWorkRef.Create;
        ipItem2Plan.planRef.code := plan.code;
        ipItem2Plan.ipItemRef := ENIPItemRef.Create;
        ipItem2Plan.ipItemRef.code := ENIPItemObj.code;

        TempENIPItem2Plan.add(ipItem2Plan);
      end;

      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkShow.Free;
    frmENPlanWorkShow:=nil;
  end;
end;


procedure TfrmENIPItemEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcIPItemChange(Sender);
end;


procedure TfrmENIPItemEdit.actViewPlanExecute(Sender: TObject);
var
  objCode : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  tPlan : ENPlanWork;
begin
  inherited;
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode( objCode );
  if (tPlan = nil) then
  begin
    exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);

  try
    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;


procedure TfrmENIPItemEdit.btnEditInsideSumClick(Sender: TObject);
var
  TempENIPItem: ENIPItemControllerSoapPort;
begin
  inherited;

   if not isEditingInsideSum then
      begin
       btnEditInsideSum.Caption := 'Зберегти суми для фінансування';
       isEditingInsideSum:= True;
              DisableControls([edtPriceInside , edtCountGenInside , edtSumGenInside
        , edtmm1countInside
        , edtmm1sumInside
        , edtmm2countInside
        , edtmm2sumInside
        , edtmm3countInside
        , edtmm3sumInside
        , edtmm4countInside
        , edtmm4sumInside
        , edtmm5countInside
        , edtmm5sumInside
        , edtmm6countInside
        , edtmm6sumInside
        , edtmm7countInside
        , edtmm7sumInside
        , edtmm8countInside
        , edtmm8sumInside
        , edtmm9countInside
        , edtmm9sumInside
        , edtmm10countInside
        , edtmm10sumInside
        , edtmm11countInside
        , edtmm11sumInside
        , edtmm12countInside
        , edtmm12sumInside
        ] , false );


      end
   else
   begin



        if Application.MessageBox(PChar('Ви дійсно бажаєте зберегти Зміни ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;


             if (ENIPItemObj.countGenInside = nil ) then
               ENIPItemObj.countGenInside := TXSDecimal.Create;
             if edtCountGenInside.Text <> '' then
               ENIPItemObj.countGenInside.decimalString := edtCountGenInside.Text
             else
               ENIPItemObj.countGenInside := nil;

             if (ENIPItemObj.priceInside = nil ) then
               ENIPItemObj.priceInside := TXSDecimal.Create;
             if edtPriceInside.Text <> '' then
               ENIPItemObj.priceInside.decimalString := edtPriceInside.Text
             else
               ENIPItemObj.priceInside := nil;

             if (ENIPItemObj.sumGenInside = nil ) then
               ENIPItemObj.sumGenInside := TXSDecimal.Create;
             if edtSumGenInside.Text <> '' then
               ENIPItemObj.sumGenInside.decimalString := edtSumGenInside.Text
             else
               ENIPItemObj.sumGenInside := nil;

             if (ENIPItemObj.mm1countInside = nil ) then
               ENIPItemObj.mm1countInside := TXSDecimal.Create;
             if edtmm1countInside.Text <> '' then
               ENIPItemObj.mm1countInside.decimalString := edtmm1countInside.Text
             else
               ENIPItemObj.mm1countInside := nil;

             if (ENIPItemObj.mm1sumInside = nil ) then
               ENIPItemObj.mm1sumInside := TXSDecimal.Create;
             if edtmm1sumInside.Text <> '' then
               ENIPItemObj.mm1sumInside.decimalString := edtmm1sumInside.Text
             else
               ENIPItemObj.mm1sumInside := nil;


               if (ENIPItemObj.mm2countInside = nil ) then
               ENIPItemObj.mm2countInside := TXSDecimal.Create;
             if edtmm2countInside.Text <> '' then
               ENIPItemObj.mm2countInside.decimalString := edtmm2countInside.Text
             else
               ENIPItemObj.mm2countInside := nil;

             if (ENIPItemObj.mm2sumInside = nil ) then
               ENIPItemObj.mm2sumInside := TXSDecimal.Create;
             if edtmm2sumInside.Text <> '' then
               ENIPItemObj.mm2sumInside.decimalString := edtmm2sumInside.Text
             else
               ENIPItemObj.mm2sumInside := nil;


             if (ENIPItemObj.mm3countInside = nil ) then
               ENIPItemObj.mm3countInside := TXSDecimal.Create;
             if edtmm3countInside.Text <> '' then
               ENIPItemObj.mm3countInside.decimalString := edtmm3countInside.Text
             else
               ENIPItemObj.mm3countInside := nil;

             if (ENIPItemObj.mm3sumInside = nil ) then
               ENIPItemObj.mm3sumInside := TXSDecimal.Create;
             if edtmm3sumInside.Text <> '' then
               ENIPItemObj.mm3sumInside.decimalString := edtmm3sumInside.Text
             else
               ENIPItemObj.mm3sumInside := nil;



             if (ENIPItemObj.mm4countInside = nil ) then
               ENIPItemObj.mm4countInside := TXSDecimal.Create;
             if edtmm4countInside.Text <> '' then
               ENIPItemObj.mm4countInside.decimalString := edtmm4countInside.Text
             else
               ENIPItemObj.mm4countInside := nil;

             if (ENIPItemObj.mm4sumInside = nil ) then
               ENIPItemObj.mm4sumInside := TXSDecimal.Create;
             if edtmm4sumInside.Text <> '' then
               ENIPItemObj.mm4sumInside.decimalString := edtmm4sumInside.Text
             else
               ENIPItemObj.mm4sumInside := nil;

              if (ENIPItemObj.mm5countInside = nil ) then
               ENIPItemObj.mm5countInside := TXSDecimal.Create;
             if edtmm5countInside.Text <> '' then
               ENIPItemObj.mm5countInside.decimalString := edtmm5countInside.Text
             else
               ENIPItemObj.mm5countInside := nil;

             if (ENIPItemObj.mm5sumInside = nil ) then
               ENIPItemObj.mm5sumInside := TXSDecimal.Create;
             if edtmm5sumInside.Text <> '' then
               ENIPItemObj.mm5sumInside.decimalString := edtmm5sumInside.Text
             else
               ENIPItemObj.mm5sumInside := nil;


             if (ENIPItemObj.mm6countInside = nil ) then
               ENIPItemObj.mm6countInside := TXSDecimal.Create;
             if edtmm6countInside.Text <> '' then
               ENIPItemObj.mm6countInside.decimalString := edtmm6countInside.Text
             else
               ENIPItemObj.mm6countInside := nil;

             if (ENIPItemObj.mm6sumInside = nil ) then
               ENIPItemObj.mm6sumInside := TXSDecimal.Create;
             if edtmm6sumInside.Text <> '' then
               ENIPItemObj.mm6sumInside.decimalString := edtmm6sumInside.Text
             else
               ENIPItemObj.mm6sumInside := nil;


             if (ENIPItemObj.mm7countInside = nil ) then
               ENIPItemObj.mm7countInside := TXSDecimal.Create;
             if edtmm7countInside.Text <> '' then
               ENIPItemObj.mm7countInside.decimalString := edtmm7countInside.Text
             else
               ENIPItemObj.mm7countInside := nil;

             if (ENIPItemObj.mm7sumInside = nil ) then
               ENIPItemObj.mm7sumInside := TXSDecimal.Create;
             if edtmm7sumInside.Text <> '' then
               ENIPItemObj.mm7sumInside.decimalString := edtmm7sumInside.Text
             else
               ENIPItemObj.mm7sumInside := nil;


             if (ENIPItemObj.mm8countInside = nil ) then
               ENIPItemObj.mm8countInside := TXSDecimal.Create;
             if edtmm8countInside.Text <> '' then
               ENIPItemObj.mm8countInside.decimalString := edtmm8countInside.Text
             else
               ENIPItemObj.mm8countInside := nil;

             if (ENIPItemObj.mm8sumInside = nil ) then
               ENIPItemObj.mm8sumInside := TXSDecimal.Create;
             if edtmm8sumInside.Text <> '' then
               ENIPItemObj.mm8sumInside.decimalString := edtmm8sumInside.Text
             else
               ENIPItemObj.mm8sumInside := nil;


             if (ENIPItemObj.mm9countInside = nil ) then
               ENIPItemObj.mm9countInside := TXSDecimal.Create;
             if edtmm9countInside.Text <> '' then
               ENIPItemObj.mm9countInside.decimalString := edtmm9countInside.Text
             else
               ENIPItemObj.mm9countInside := nil;

             if (ENIPItemObj.mm9sumInside = nil ) then
               ENIPItemObj.mm9sumInside := TXSDecimal.Create;
             if edtmm9sumInside.Text <> '' then
               ENIPItemObj.mm9sumInside.decimalString := edtmm9sumInside.Text
             else
               ENIPItemObj.mm9sumInside := nil;

             if (ENIPItemObj.mm10countInside = nil ) then
               ENIPItemObj.mm10countInside := TXSDecimal.Create;
             if edtmm10countInside.Text <> '' then
               ENIPItemObj.mm10countInside.decimalString := edtmm10countInside.Text
             else
               ENIPItemObj.mm10countInside := nil;

             if (ENIPItemObj.mm10sumInside = nil ) then
               ENIPItemObj.mm10sumInside := TXSDecimal.Create;
             if edtmm10sumInside.Text <> '' then
               ENIPItemObj.mm10sumInside.decimalString := edtmm10sumInside.Text
             else
               ENIPItemObj.mm10sumInside := nil;


             if (ENIPItemObj.mm11countInside = nil ) then
               ENIPItemObj.mm11countInside := TXSDecimal.Create;
             if edtmm11countInside.Text <> '' then
               ENIPItemObj.mm11countInside.decimalString := edtmm11countInside.Text
             else
               ENIPItemObj.mm11countInside := nil;

             if (ENIPItemObj.mm11sumInside = nil ) then
               ENIPItemObj.mm11sumInside := TXSDecimal.Create;
             if edtmm11sumInside.Text <> '' then
               ENIPItemObj.mm11sumInside.decimalString := edtmm11sumInside.Text
             else
               ENIPItemObj.mm11sumInside := nil;


             if (ENIPItemObj.mm12countInside = nil ) then
               ENIPItemObj.mm12countInside := TXSDecimal.Create;
             if edtmm12countInside.Text <> '' then
               ENIPItemObj.mm12countInside.decimalString := edtmm12countInside.Text
             else
               ENIPItemObj.mm12countInside := nil;

             if (ENIPItemObj.mm12sumInside = nil ) then
               ENIPItemObj.mm12sumInside := TXSDecimal.Create;
             if edtmm12sumInside.Text <> '' then
               ENIPItemObj.mm12sumInside.decimalString := edtmm12sumInside.Text
             else
               ENIPItemObj.mm12sumInside := nil;

            TempENIPItem.saveSumInside(ENIPItemObj);

            btnEditInsideSum.Caption := 'Редагувати суми для фінансування';
            isEditingInsideSum:= False;

            DisableControls([edtPriceInside , edtCountGenInside , edtSumGenInside
              , edtmm1countInside
              , edtmm1sumInside
              , edtmm2countInside
              , edtmm2sumInside
              , edtmm3countInside
              , edtmm3sumInside
              , edtmm4countInside
              , edtmm4sumInside
              , edtmm5countInside
              , edtmm5sumInside
              , edtmm6countInside
              , edtmm6sumInside
              , edtmm7countInside
              , edtmm7sumInside
              , edtmm8countInside
              , edtmm8sumInside
              , edtmm9countInside
              , edtmm9sumInside
              , edtmm10countInside
              , edtmm10sumInside
              , edtmm11countInside
              , edtmm11sumInside
              , edtmm12countInside
              , edtmm12sumInside ]);
        end
        else
         // передумали менять суммы , нада вернуть как было т.е с обекта
        begin

              if ( ENIPItemObj.countGenInside <> nil ) then
                 edtCountGenInside.Text := ENIPItemObj.countGenInside.decimalString
              else
                 edtCountGenInside.Text := '0';
              if ( ENIPItemObj.priceInside <> nil ) then
                 edtPriceInside.Text := ENIPItemObj.priceInside.decimalString
              else
                 edtPriceInside.Text := '0';
              if ( ENIPItemObj.sumGenInside <> nil ) then
                 edtSumGenInside.Text := ENIPItemObj.sumGenInside.decimalString
              else
                 edtSumGenInside.Text := '0';
              if ( ENIPItemObj.mm1countInside <> nil ) then
                 edtmm1countInside.Text := ENIPItemObj.mm1countInside.decimalString
              else
                 edtmm1countInside.Text := '0';
              if ( ENIPItemObj.mm1sumInside <> nil ) then
                 edtmm1sumInside.Text := ENIPItemObj.mm1sumInside.decimalString
              else
                 edtmm1sumInside.Text := '0';


              if ( ENIPItemObj.mm2countInside <> nil ) then
                 edtmm2countInside.Text := ENIPItemObj.mm2countInside.decimalString
              else
                 edtmm2countInside.Text := '0';
              if ( ENIPItemObj.mm2sumInside <> nil ) then
                 edtmm2sumInside.Text := ENIPItemObj.mm2sumInside.decimalString
              else
                 edtmm2sumInside.Text := '0';


              if ( ENIPItemObj.mm3countInside <> nil ) then
                 edtmm3countInside.Text := ENIPItemObj.mm3countInside.decimalString
              else
                 edtmm3countInside.Text := '0';
              if ( ENIPItemObj.mm3sumInside <> nil ) then
                 edtmm3sumInside.Text := ENIPItemObj.mm3sumInside.decimalString
              else
                 edtmm3sumInside.Text := '0';



              if ( ENIPItemObj.mm4countInside <> nil ) then
                 edtmm4countInside.Text := ENIPItemObj.mm4countInside.decimalString
              else
                 edtmm4countInside.Text := '0';
              if ( ENIPItemObj.mm4sumInside <> nil ) then
                 edtmm4sumInside.Text := ENIPItemObj.mm4sumInside.decimalString
              else
                 edtmm4sumInside.Text := '0';


              if ( ENIPItemObj.mm5countInside <> nil ) then
                 edtmm5countInside.Text := ENIPItemObj.mm5countInside.decimalString
              else
                 edtmm5countInside.Text := '0';
              if ( ENIPItemObj.mm5sumInside <> nil ) then
                 edtmm5sumInside.Text := ENIPItemObj.mm5sumInside.decimalString
              else
                 edtmm5sumInside.Text := '0';


              if ( ENIPItemObj.mm6countInside <> nil ) then
                 edtmm6countInside.Text := ENIPItemObj.mm6countInside.decimalString
              else
                 edtmm6countInside.Text := '0';
              if ( ENIPItemObj.mm6sumInside <> nil ) then
                 edtmm6sumInside.Text := ENIPItemObj.mm6sumInside.decimalString
              else
                 edtmm6sumInside.Text := '0';

              if ( ENIPItemObj.mm7countInside <> nil ) then
                 edtmm7countInside.Text := ENIPItemObj.mm7countInside.decimalString
              else
                 edtmm7countInside.Text := '0';
              if ( ENIPItemObj.mm7sumInside <> nil ) then
                 edtmm7sumInside.Text := ENIPItemObj.mm7sumInside.decimalString
              else
                 edtmm7sumInside.Text := '0';


              if ( ENIPItemObj.mm8countInside <> nil ) then
                 edtmm8countInside.Text := ENIPItemObj.mm8countInside.decimalString
              else
                 edtmm8countInside.Text := '0';
              if ( ENIPItemObj.mm8sumInside <> nil ) then
                 edtmm8sumInside.Text := ENIPItemObj.mm8sumInside.decimalString
              else
                 edtmm8sumInside.Text := '0';


              if ( ENIPItemObj.mm9countInside <> nil ) then
                 edtmm9countInside.Text := ENIPItemObj.mm9countInside.decimalString
              else
                 edtmm9countInside.Text := '0';
              if ( ENIPItemObj.mm9sumInside <> nil ) then
                 edtmm9sumInside.Text := ENIPItemObj.mm9sumInside.decimalString
              else
                 edtmm9sumInside.Text := '0';


              if ( ENIPItemObj.mm10countInside <> nil ) then
                 edtmm10countInside.Text := ENIPItemObj.mm10countInside.decimalString
              else
                 edtmm10countInside.Text := '0';
              if ( ENIPItemObj.mm10sumInside <> nil ) then
                 edtmm10sumInside.Text := ENIPItemObj.mm10sumInside.decimalString
              else
                 edtmm10sumInside.Text := '0';


              if ( ENIPItemObj.mm11countInside <> nil ) then
                 edtmm11countInside.Text := ENIPItemObj.mm11countInside.decimalString
              else
                 edtmm11countInside.Text := '0';
              if ( ENIPItemObj.mm11sumInside <> nil ) then
                 edtmm11sumInside.Text := ENIPItemObj.mm11sumInside.decimalString
              else
                 edtmm11sumInside.Text := '0';


              if ( ENIPItemObj.mm12countInside <> nil ) then
                 edtmm12countInside.Text := ENIPItemObj.mm12countInside.decimalString
              else
                 edtmm12countInside.Text := '0';
              if ( ENIPItemObj.mm12sumInside <> nil ) then
                 edtmm12sumInside.Text := ENIPItemObj.mm12sumInside.decimalString
              else
                 edtmm12sumInside.Text := '0';


            DisableControls([edtPriceInside , edtCountGenInside , edtSumGenInside
              , edtmm1countInside
              , edtmm1sumInside
              , edtmm2countInside
              , edtmm2sumInside
              , edtmm3countInside
              , edtmm3sumInside
              , edtmm4countInside
              , edtmm4sumInside
              , edtmm5countInside
              , edtmm5sumInside
              , edtmm6countInside
              , edtmm6sumInside
              , edtmm7countInside
              , edtmm7sumInside
              , edtmm8countInside
              , edtmm8sumInside
              , edtmm9countInside
              , edtmm9sumInside
              , edtmm10countInside
              , edtmm10sumInside
              , edtmm11countInside
              , edtmm11sumInside
              , edtmm12countInside
              , edtmm12sumInside ]);

            btnEditInsideSum.Caption := 'Редагувати суми для фінансування';
            isEditingInsideSum:= False;
        end;
   end;


end;

procedure TfrmENIPItemEdit.btnInfoTendersClick(Sender: TObject);
var
  TempENIPItem: ENIPItemControllerSoapPort;

begin
  inherited;

   if not isEditinginfoTenders then
      begin
       btnInfoTenders.Caption := 'Зберегти інформацію';
       isEditinginfoTenders:= True;
              DisableControls([edtInfoTenders] , false );

      end
   else
   begin
        if Application.MessageBox(PChar('Ви дійсно бажаєте зберегти Зміни ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            TempENIPItem := HTTPRIOENIPItem as ENIPItemControllerSoapPort;


            ENIPItemObj.infoTenders := edtInfoTenders.Text;

            TempENIPItem.saveinfoTenders(ENIPItemObj);

            btnInfoTenders.Caption := 'Редагувати інформацію';
            isEditinginfoTenders:= False;

            DisableControls([edtInfoTenders]);
        end
        else
         // передумали менять суммы , нада вернуть как было т.е с обекта
        begin

             MakeMultiline(edtInfoTenders.Lines, infoTenders);


            DisableControls([edtInfoTenders]);

            btnInfoTenders.Caption := 'Редагувати інформацію';
            isEditinginfoTenders:= False;
        end;
   end;


end;

procedure TfrmENIPItemEdit.edtPriceChange(Sender: TObject);
var price, count,
    countQ1, countQ2, countQ3, countQ4: Double;
begin
 if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
      try
        price := StrToFloat(edtPrice.Text);
      except
        on EConvertError do
          price := 0;
      end;

      {
      try
        count := StrToFloat(edtCountGen.Text);
      except
        on EConvertError do
          count := 0;
      end;
      }

      try
        countQ1 := StrToFloat(edtQuarter1count.Text);
      except
        on EConvertError do
          countQ1 := 0;
      end;

      try
        countQ2 := StrToFloat(edtQuarter2count.Text);
      except
        on EConvertError do
          countQ2 := 0;
      end;

      try
        countQ3 := StrToFloat(edtQuarter3count.Text);
      except
        on EConvertError do
          countQ3 := 0;
      end;

      try
        countQ4 := StrToFloat(edtQuarter4count.Text);
      except
        on EConvertError do
          countQ4 := 0;
      end;

      edtQuarter1sum.Text := FloatToStr(Conv(price * countQ1, 3));
      edtQuarter2sum.Text := FloatToStr(Conv(price * countQ2, 3));
      edtQuarter3sum.Text := FloatToStr(Conv(price * countQ3, 3));
      edtQuarter4sum.Text := FloatToStr(Conv(price * countQ4, 3));

      if edtQuarter1count.Text = '' then edtQuarter1count.Text := '0';
      if edtQuarter2count.Text = '' then edtQuarter2count.Text := '0';
      if edtQuarter3count.Text = '' then edtQuarter3count.Text := '0';
      if edtQuarter4count.Text = '' then edtQuarter4count.Text := '0';


      count := Conv(Conv(countQ1, 6) + Conv(countQ2, 6) +
                    Conv(countQ3, 6) + Conv(countQ4, 6), 6);

      edtCountGen.Text := FloatToStr(count);

      //edtSumGen.Text := FloatToStrF(price * count, ffFixed, 15, 2);
      edtSumGen.Text := FloatToStr(Conv(price * count, 3));
  end;
end;


procedure TfrmENIPItemEdit.edtPriceInsideChange(Sender: TObject);
var price, count,
     countM1, countM2, countM3, countM4, countM5 , countM6
    ,countM7, countM8, countM9, countM10, countM11 , countM12 : Double;
begin
 if ((DialogState = dsEdit) or (DialogState = dsView) )then
  begin
      try
        price := StrToFloat(edtPriceInside.Text);
      except
        on EConvertError do
          price := 0;
      end;


     try
        countM1 := StrToFloat(edtmm1countInside.Text);
      except
        on EConvertError do
          countM1 := 0;
      end;

      try
        countM2 := StrToFloat(edtmm2countInside.Text);
      except
        on EConvertError do
          countM2 := 0;
      end;

      try
        countM3 := StrToFloat(edtmm3countInside.Text);
      except
        on EConvertError do
          countM3 := 0;
      end;

      try
        countM4 := StrToFloat(edtmm4countInside.Text);
      except
        on EConvertError do
          countM4 := 0;
      end;

      try
        countM5 := StrToFloat(edtmm5countInside.Text);
      except
        on EConvertError do
          countM5 := 0;
      end;

      try
        countM6 := StrToFloat(edtmm6countInside.Text);
      except
        on EConvertError do
          countM6 := 0;
      end;

      try
        countM7 := StrToFloat(edtmm7countInside.Text);
      except
        on EConvertError do
          countM7 := 0;
      end;

      try
        countM8 := StrToFloat(edtmm8countInside.Text);
      except
        on EConvertError do
          countM8 := 0;
      end;

      try
        countM9 := StrToFloat(edtmm9countInside.Text);
      except
        on EConvertError do
          countM9 := 0;
      end;

      try
        countM10 := StrToFloat(edtmm10countInside.Text);
      except
        on EConvertError do
          countM10 := 0;
      end;


      try
        countM11 := StrToFloat(edtmm11countInside.Text);
      except
        on EConvertError do
          countM11 := 0;
      end;

      try
        countM12 := StrToFloat(edtmm12countInside.Text);
      except
        on EConvertError do
          countM12 := 0;
      end;

      edtmm1sumInside.Text := FloatToStr(Conv(price * countM1, 3));
      edtmm2sumInside.Text := FloatToStr(Conv(price * countM2, 3));
      edtmm3sumInside.Text := FloatToStr(Conv(price * countM3, 3));
      edtmm4sumInside.Text := FloatToStr(Conv(price * countM4, 3));
      edtmm5sumInside.Text := FloatToStr(Conv(price * countM5, 3));
      edtmm6sumInside.Text := FloatToStr(Conv(price * countM6, 3));
      edtmm7sumInside.Text := FloatToStr(Conv(price * countM7, 3));
      edtmm8sumInside.Text := FloatToStr(Conv(price * countM8, 3));
      edtmm9sumInside.Text := FloatToStr(Conv(price * countM9, 3));
      edtmm10sumInside.Text := FloatToStr(Conv(price * countM10, 3));
      edtmm11sumInside.Text := FloatToStr(Conv(price * countM11, 3));
      edtmm12sumInside.Text := FloatToStr(Conv(price * countM12, 3));

//      if edtQuarter1countInside.Text = '' then edtQuarter1countInside.Text := '0';
//      if edtQuarter2countInside.Text = '' then edtQuarter2countInside.Text := '0';
//      if edtQuarter3countInside.Text = '' then edtQuarter3countInside.Text := '0';
//      if edtQuarter4countInside.Text = '' then edtQuarter4countInside.Text := '0';


      count := Conv(Conv(countM1, 6) + Conv(countM2, 6) +
                    Conv(countM3, 6) + Conv(countM4, 6) +
                    Conv(countM5, 6) + Conv(countM6, 6) +
                    Conv(countM7, 6) + Conv(countM8, 6) +
                    Conv(countM9, 6) + Conv(countM10, 6) +
                    Conv(countM11, 6) + Conv(countM12, 6) , 6);

      edtCountGenInside.Text := FloatToStr(count);

      edtSumGenInside.Text := FloatToStr(Conv(price * count, 3));
  end;
end;

procedure TfrmENIPItemEdit.edtSumGenChange(Sender: TObject);
var price, count,
    sumQ1, sumQ2, sumQ3, sumQ4: Double;
begin

    if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
      try
        sumQ1 := StrToFloat(edtQuarter1sum.Text);
      except
        on EConvertError do
          sumQ1 := 0;
      end;

      try
        sumQ2 := StrToFloat(edtQuarter2sum.Text);
      except
        on EConvertError do
          sumQ2 := 0;
      end;

      try
        sumQ3 := StrToFloat(edtQuarter3sum.Text);
      except
        on EConvertError do
          sumQ3 := 0;
      end;

      try
        sumQ4 := StrToFloat(edtQuarter4sum.Text);
      except
        on EConvertError do
          sumQ4 := 0;
      end;



      edtSumGen.Text := FloatToStr(Conv(sumQ1+sumQ2+sumQ3+sumQ4,3));
  end;
end;

end.