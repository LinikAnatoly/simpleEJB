unit EditENSubst150VRUZRU;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150VRUZRUController, AdvObj ;

type
  TfrmENSubst150VRUZRUEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
  

    HTTPRIOENSubst150VRUZRU: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    PageControl: TPageControl;
    tsmain: TTabSheet;
    tsSubst150Grounding: TTabSheet;
    lblNameDisp: TLabel;
    edtNameDisp: TMemo;
    lblName: TLabel;
    edtName: TMemo;
    edtInstallDate: TDateTimePicker;
    lblInstallDate: TLabel;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ImageList1: TImageList;
    ToolBar6: TToolBar;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton42: TToolButton;
    sgENSubst150Grounding: TAdvStringGrid;
    HTTPRIOENSubst150Grounding: THTTPRIO;
    tsSubst150CABLECHANNEL: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    sgENSubst150CableChannel: TAdvStringGrid;
    HTTPRIOENSubst150CableChannel: THTTPRIO;
    tsSubst150BUILDZRU: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENSubst150BuildZru: TAdvStringGrid;
    HTTPRIOENSubst150BuildZru: THTTPRIO;
    tsSubst150BuildingAdditional: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    sgENSubst150BuildingAdditional: TAdvStringGrid;
    HTTPRIOENSubst150BuildingAdditional: THTTPRIO;
    tsSubst150OilCollecting: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    sgENSubst150OilCollecting: TAdvStringGrid;
    HTTPRIOENSubst150OilCollecting: THTTPRIO;
    tsSubst150ExternalFence: TTabSheet;
    ToolBar5: TToolBar;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    sgENSubst150ExternalFence: TAdvStringGrid;
    HTTPRIOENSubst150ExternalFence: THTTPRIO;
    tsSubst150LOADSWITCH: TTabSheet;
    ToolBar7: TToolBar;
    ToolButton43: TToolButton;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    HTTPRIOENLoadSwitch: THTTPRIO;
    sgENLoadSwitch: TAdvStringGrid;
    tsSubst150Disconnector: TTabSheet;
    ToolBar8: TToolBar;
    ToolButton50: TToolButton;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ToolButton53: TToolButton;
    ToolButton54: TToolButton;
    ToolButton55: TToolButton;
    ToolButton56: TToolButton;
    sgENSubst150Disconnector: TAdvStringGrid;
    HTTPRIOENSubst150Disconnector: THTTPRIO;
    tsSubst150TireSection: TTabSheet;
    ToolBar12: TToolBar;
    ToolButton78: TToolButton;
    ToolButton79: TToolButton;
    ToolButton80: TToolButton;
    ToolButton81: TToolButton;
    ToolButton82: TToolButton;
    ToolButton83: TToolButton;
    ToolButton84: TToolButton;
    sgENSubst150TireSection: TAdvStringGrid;
    HTTPRIOENSubst150TireSection: THTTPRIO;
    tsSubst150Arrester: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton57: TToolButton;
    ToolButton58: TToolButton;
    ToolButton59: TToolButton;
    ToolButton60: TToolButton;
    ToolButton61: TToolButton;
    ToolButton62: TToolButton;
    ToolButton63: TToolButton;
    sgENArrester: TAdvStringGrid;
    HTTPRIOENArrester: THTTPRIO;
    tsSubst150TransformerMeasure: TTabSheet;
    ToolBar10: TToolBar;
    ToolButton64: TToolButton;
    ToolButton65: TToolButton;
    ToolButton66: TToolButton;
    ToolButton67: TToolButton;
    ToolButton68: TToolButton;
    ToolButton69: TToolButton;
    ToolButton70: TToolButton;
    sgENSubst150TransformerMeasure: TAdvStringGrid;
    HTTPRIOENSubst150TransformerMeasure: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSubst150VRUZRUEdit: TfrmENSubst150VRUZRUEdit;
  ENSubst150VRUZRUObj: ENSubst150VRUZRU;

  LastCount: Integer;
  LastRow: Integer = 1;

  ENSubst150GroundingHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

   ENSubst150cablechannelHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

   ENSubst150BUILDZRUHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );
   ENSubst150BuildingAdditionalHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );
   ENSubst150EXTERNALFENCHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

        ENLoadSwitchHeaders: array [1..8] of String =
        ('Код'
       , 'Вимикач навантаження'
       , 'Диспетчерська назва'
       , 'Привід'
       , 'Напруга ном., кВ'
       , 'Струм ном., А'
       , 'ТП 6 - 10 / 0,4 кВ'
       , '№ Високовольтної Ланки');

       ENArresterHeaders: array [1..6] of String =
        (  'Код'
         , 'Разрядник'
         , 'Диспетчерское название'
         , 'Место установки'
         , 'ТП 6 - 10 / 0,4 кВ'
         , '№ Високовольтної Ланки');

          ENSubst150TransformerMeasureHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );
         ENSubst150TireSectionHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

        ENSubst150DisconnectorHeaders : array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );
        ENSubst150OilCollectingHeaders : array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );




implementation

uses
  ShowENElement
  ,ENElementController
, ENSubst150GroundingController, EditENSubst150Grounding,
  ENSubstation150Controller, EditENSubst150CableChannel,
  ENSubst150CableChannelController, ENSubst150BuildZruController,
  EditENSubst150BuildZru, ENSubst150BuildingAdditionalController,
  EditENSubst150BuildingAdditional, ENSubst150OilCollectingController,
  EditENSubst150OilCollecting, ENSubst150ExternalFenceController,
  EditENSubst150ExternalFence, ENLoadSwitchController, EditENLoadSwitch,
  ENSubst150DisconnectorController, EditENSubst150Disconnector,
  ENSubst150TireSectionController, EditENSubst150TireSection,
  ENArresterController, EditENArrester, ENSubst150TransformerMeasureController,
  EditENSubst150TransformerMeasure;


{$R *.dfm}

procedure TfrmENSubst150VRUZRUEdit.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := tsmain;

  SetGridHeaders(ENSubst150GroundingHeaders, sgENSubst150Grounding.ColumnHeaders);
  SetGridHeaders(ENSubst150cablechannelHeaders, sgENSubst150cablechannel.ColumnHeaders);
  SetGridHeaders(ENSubst150BUILDZRUHeaders, sgENSubst150BUILDZRU.ColumnHeaders);
  SetGridHeaders(ENSubst150BuildingAdditionalHeaders, sgENSubst150BuildingAdditional.ColumnHeaders);
  SetGridHeaders(ENSubst150EXTERNALFENCHeaders, sgENSubst150ExternalFence.ColumnHeaders);
  SetGridHeaders(ENLoadSwitchHeaders, sgENLoadSwitch.ColumnHeaders);
  SetGridHeaders(ENSubst150TransformerMeasureHeaders, sgENSubst150TransformerMeasure.ColumnHeaders);
  SetGridHeaders(ENSubst150TireSectionHeaders, sgENSubst150TireSection.ColumnHeaders);
  SetGridHeaders(ENSubst150DisconnectorHeaders, sgENSubst150Disconnector.ColumnHeaders);
  SetGridHeaders(ENSubst150OilCollectingHeaders, sgENSubst150OilCollecting.ColumnHeaders);






  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      {edtENElementElementName
      ,spbENElementElement}
       ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode
    ]);


    tsSubst150Grounding.TabVisible:= false;
    tsSubst150CABLECHANNEL.TabVisible:= false;
    tsSubst150BUILDZRU.TabVisible:= false;
    tsSubst150BuildingAdditional.TabVisible:= false;
    tsSubst150OilCollecting.TabVisible:= false;
    tsSubst150ExternalFence.TabVisible:= false;
    tsSubst150LOADSWITCH.TabVisible:= false;
    tsSubst150Disconnector.TabVisible:= false;
    tsSubst150TireSection.TabVisible:= false;
    tsSubst150Arrester.TabVisible:= false;
    tsSubst150TransformerMeasure.TabVisible:= false;

  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtNameDisp
      ,edtName
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENSubst150VRUZRUObj.code);
    MakeMultiline(edtNameDisp.Lines, ENSubst150VRUZRUObj.nameDisp);
    MakeMultiline(edtName.Lines, ENSubst150VRUZRUObj.name);
    SetDateFieldForDateTimePicker(edtInstallDate, ENSubst150VRUZRUObj.installDate);
    MakeMultiline(edtCommentGen.Lines, ENSubst150VRUZRUObj.commentGen);
  end;
end;



procedure TfrmENSubst150VRUZRUEdit.PageControlChange(Sender: TObject);
var
  i : Integer;
  TempENSubst150Grounding: ENSubst150GroundingControllerSoapPort;
  GroundingList : ENSubst150GroundingShortList;
  GroundingFilter : ENSubst150GroundingFilter;

  TempENSubst150CABLECHANNEL: ENSubst150CABLECHANNELControllerSoapPort;
  CABLECHANNELList : ENSubst150CABLECHANNELShortList;
  CABLECHANNELFilter : ENSubst150CABLECHANNELFilter;

  TempENSubst150BuildZru: ENSubst150BuildZruControllerSoapPort;
  BuildZruList : ENSubst150BuildZruShortList;
  BuildZruFilter : ENSubst150BuildZruFilter;

  TempENSubst150BuildingAdditional: ENSubst150BuildingAdditionalControllerSoapPort;
  BuildingAdditionalList : ENSubst150BuildingAdditionalShortList;
  BuildingAdditionalFilter : ENSubst150BuildingAdditionalFilter;

  TempENSubst150OilCollecting: ENSubst150OilCollectingControllerSoapPort;
  OilCollectingList : ENSubst150OilCollectingShortList;
  OilCollectingFilter : ENSubst150OilCollectingFilter;

  TempENSubst150ExternalFence: ENSubst150ExternalFenceControllerSoapPort;
  ExternalFenceList : ENSubst150ExternalFenceShortList;
  ExternalFenceFilter : ENSubst150ExternalFenceFilter;

  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  ENLoadSwitchList: ENLoadSwitchShortList;
  SwitchFilter: ENLoadSwitchFilter;

  TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
  disconnectorList : ENSubst150DisconnectorShortList;
  disconnectorFilter : ENSubst150DisconnectorFilter;

  TempENSubst150TireSection: ENSubst150TireSectionControllerSoapPort;
  TireSectionList: ENSubst150TireSectionShortList;
  TireSectionFilter: ENSubst150TireSectionFilter;

  TempENArrester: ENArresterControllerSoapPort;
  ENArresterList: ENArresterShortList;
  arresterfilter : ENArresterFilter;

  TempENSubst150TransformerMeasure: ENSubst150TransformerMeasureControllerSoapPort;
  TransformerMeasureList : ENSubst150TransformerMeasureShortList;
  TransformerMeasureFilter : ENSubst150TransformerMeasureFilter;
begin
   // start  tsSubst150Grounding   ---------------
  if ( PageControl.ActivePage = tsSubst150Grounding) then
  begin
    ClearGrid(sgENSubst150Grounding);

    TempENSubst150Grounding :=  HTTPRIOENSubst150Grounding as ENSubst150GroundingControllerSoapPort;

    GroundingFilter := ENSubst150GroundingFilter.Create;
    SetNullIntProps(GroundingFilter);
    SetNullXSProps(GroundingFilter);
    GroundingFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    GroundingFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    GroundingList := TempENSubst150Grounding.getScrollableFilteredList(GroundingFilter,0,-1);
    LastCount:=High(GroundingList.list);

    if LastCount > -1 then
       sgENSubst150Grounding.RowCount:=LastCount+2
    else
       sgENSubst150Grounding.RowCount:=2;

     with sgENSubst150Grounding do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if GroundingList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(GroundingList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := GroundingList.list[i].name;
          Cells[2,i+1] := GroundingList.list[i].factoryNumber;
          Cells[3,i+1] := GroundingList.list[i].typeRefName;
          if GroundingList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := GroundingList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := GroundingList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150Grounding.RowCount:=LastRow+1;
        end;

     sgENSubst150Grounding.Row:=1;
  end;
  // end  tsSubst150Grounding   ---------------

   // start  tsSubst150CABLECHANNEL   ---------------
  if ( PageControl.ActivePage = tsSubst150CABLECHANNEL) then
  begin
    ClearGrid(sgENSubst150CABLECHANNEL);

    TempENSubst150CABLECHANNEL :=  HTTPRIOENSubst150CABLECHANNEL as ENSubst150CABLECHANNELControllerSoapPort;

    CABLECHANNELFilter := ENSubst150CABLECHANNELFilter.Create;
    SetNullIntProps(CABLECHANNELFilter);
    SetNullXSProps(CABLECHANNELFilter);
    CABLECHANNELFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    CABLECHANNELFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    CABLECHANNELList := TempENSubst150CABLECHANNEL.getScrollableFilteredList(CABLECHANNELFilter,0,-1);
    LastCount:=High(CABLECHANNELList.list);

    if LastCount > -1 then
       sgENSubst150CABLECHANNEL.RowCount:=LastCount+2
    else
       sgENSubst150CABLECHANNEL.RowCount:=2;

     with sgENSubst150CABLECHANNEL do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if CABLECHANNELList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(CABLECHANNELList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := CABLECHANNELList.list[i].name;
          Cells[2,i+1] := CABLECHANNELList.list[i].factoryNumber;
          Cells[3,i+1] := CABLECHANNELList.list[i].typeRefName;
          if CABLECHANNELList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := CABLECHANNELList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := CABLECHANNELList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150CABLECHANNEL.RowCount:=LastRow+1;
        end;

     sgENSubst150CABLECHANNEL.Row:=1;
  end;
  // end  tsSubst150CABLECHANNEL   ---------------

  // start  tsSubst150BuildZru   ---------------
  if ( PageControl.ActivePage = tsSubst150BuildZru) then
  begin
    ClearGrid(sgENSubst150BuildZru);

    TempENSubst150BuildZru :=  HTTPRIOENSubst150BuildZru as ENSubst150BuildZruControllerSoapPort;

    BuildZruFilter := ENSubst150BuildZruFilter.Create;
    SetNullIntProps(BuildZruFilter);
    SetNullXSProps(BuildZruFilter);
    BuildZruFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    BuildZruFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    BuildZruList := TempENSubst150BuildZru.getScrollableFilteredList(BuildZruFilter,0,-1);
    LastCount:=High(BuildZruList.list);

    if LastCount > -1 then
       sgENSubst150BuildZru.RowCount:=LastCount+2
    else
       sgENSubst150BuildZru.RowCount:=2;

     with sgENSubst150BuildZru do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if BuildZruList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(BuildZruList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := BuildZruList.list[i].name;
          Cells[2,i+1] := BuildZruList.list[i].factoryNumber;
          Cells[3,i+1] := BuildZruList.list[i].typeRefName;
          if BuildZruList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := BuildZruList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := BuildZruList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150BuildZru.RowCount:=LastRow+1;
        end;

     sgENSubst150BuildZru.Row:=1;
  end;
  // end  tsSubst150BuildZru   ---------------

  // start  tsSubst150BuildingAdditional   ---------------
  if ( PageControl.ActivePage = tsSubst150BuildingAdditional) then
  begin
    ClearGrid(sgENSubst150BuildingAdditional);

    TempENSubst150BuildingAdditional :=  HTTPRIOENSubst150BuildingAdditional as ENSubst150BuildingAdditionalControllerSoapPort;

    BuildingAdditionalFilter := ENSubst150BuildingAdditionalFilter.Create;
    SetNullIntProps(BuildingAdditionalFilter);
    SetNullXSProps(BuildingAdditionalFilter);
    BuildingAdditionalFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    BuildingAdditionalFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    BuildingAdditionalList := TempENSubst150BuildingAdditional.getScrollableFilteredList(BuildingAdditionalFilter,0,-1);
    LastCount:=High(BuildingAdditionalList.list);

    if LastCount > -1 then
       sgENSubst150BuildingAdditional.RowCount:=LastCount+2
    else
       sgENSubst150BuildingAdditional.RowCount:=2;

     with sgENSubst150BuildingAdditional do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if BuildingAdditionalList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(BuildingAdditionalList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := BuildingAdditionalList.list[i].name;
          Cells[2,i+1] := BuildingAdditionalList.list[i].factoryNumber;
          Cells[3,i+1] := BuildingAdditionalList.list[i].typeRefName;
          if BuildingAdditionalList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := BuildingAdditionalList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := BuildingAdditionalList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150BuildingAdditional.RowCount:=LastRow+1;
        end;

     sgENSubst150BuildingAdditional.Row:=1;
  end;
  // end  tsSubst150BuildingAdditional   ---------------


  // start  tsSubst150OilCollecting   ---------------
  if ( PageControl.ActivePage = tsSubst150OilCollecting) then
  begin
    ClearGrid(sgENSubst150OilCollecting);

    TempENSubst150OilCollecting :=  HTTPRIOENSubst150OilCollecting as ENSubst150OilCollectingControllerSoapPort;

    OilCollectingFilter := ENSubst150OilCollectingFilter.Create;
    SetNullIntProps(OilCollectingFilter);
    SetNullXSProps(OilCollectingFilter);
    OilCollectingFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    OilCollectingFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    OilCollectingList := TempENSubst150OilCollecting.getScrollableFilteredList(OilCollectingFilter,0,-1);
    LastCount:=High(OilCollectingList.list);

    if LastCount > -1 then
       sgENSubst150OilCollecting.RowCount:=LastCount+2
    else
       sgENSubst150OilCollecting.RowCount:=2;

     with sgENSubst150OilCollecting do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if OilCollectingList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(OilCollectingList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := OilCollectingList.list[i].name;
          Cells[2,i+1] := OilCollectingList.list[i].factoryNumber;
          Cells[3,i+1] := OilCollectingList.list[i].typeRefName;
          if OilCollectingList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := OilCollectingList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := OilCollectingList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150OilCollecting.RowCount:=LastRow+1;
        end;

     sgENSubst150OilCollecting.Row:=1;
  end;
  // end  tsSubst150OilCollecting   ---------------


  // start  tsSubst150ExternalFence   ---------------
  if ( PageControl.ActivePage = tsSubst150ExternalFence) then
  begin
    ClearGrid(sgENSubst150ExternalFence);

    TempENSubst150ExternalFence :=  HTTPRIOENSubst150ExternalFence as ENSubst150ExternalFenceControllerSoapPort;

    ExternalFenceFilter := ENSubst150ExternalFenceFilter.Create;
    SetNullIntProps(ExternalFenceFilter);
    SetNullXSProps(ExternalFenceFilter);
    ExternalFenceFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    ExternalFenceFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    ExternalFenceList := TempENSubst150ExternalFence.getScrollableFilteredList(ExternalFenceFilter,0,-1);
    LastCount:=High(ExternalFenceList.list);

    if LastCount > -1 then
       sgENSubst150ExternalFence.RowCount:=LastCount+2
    else
       sgENSubst150ExternalFence.RowCount:=2;

     with sgENSubst150ExternalFence do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ExternalFenceList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ExternalFenceList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := ExternalFenceList.list[i].name;
          Cells[2,i+1] := ExternalFenceList.list[i].factoryNumber;
          Cells[3,i+1] := ExternalFenceList.list[i].typeRefName;
          if ExternalFenceList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := ExternalFenceList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := ExternalFenceList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150ExternalFence.RowCount:=LastRow+1;
        end;

     sgENSubst150ExternalFence.Row:=1;
  end;
  // end  tsSubst150ExternalFence   ---------------

  /// start   LOADSWITCH
  if ( PageControl.ActivePage = tsSubst150LOADSWITCH) then
  begin

     ClearGrid(sgENLoadSwitch);

      TempENLoadSwitch :=  HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
      SwitchFilter := ENLoadSwitchFilter.Create;
      SetNullIntProps(SwitchFilter);
      SetNullXSProps(SwitchFilter);

      SwitchFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
      SwitchFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

      ENLoadSwitchList := TempENLoadSwitch.getScrollableFilteredList(SwitchFilter,0,-1);


      LastCount:=High(ENLoadSwitchList.list);

  if LastCount > -1 then
     sgENLoadSwitch.RowCount:=LastCount+2
  else
     sgENLoadSwitch.RowCount:=2;

   with sgENLoadSwitch do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLoadSwitchList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENLoadSwitchList.list[i].code)
        else //Код Выключателя нагрузки
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENLoadSwitchList.list[i].materialRefName; //Выключатель нагрузки из Нормативных материалов
        Cells[2, i + 1] := ENLoadSwitchList.list[i].name; //Диспетчерское название
        Cells[3, i + 1] := ENLoadSwitchList.list[i].matDriveRefName; //Привод Разъединителя
        if ENLoadSwitchList.list[i].ratedVoltage = nil then
          Cells[4, i + 1] := ''
        else //Номинальное напряжение, кВ
          Cells[4, i + 1] := ENLoadSwitchList.list[i].ratedVoltage.DecimalString;
        if ENLoadSwitchList.list[i].ratedCurrent = nil then
          Cells[5, i + 1] := ''
        else //Номинальный ток, А
          Cells[5, i + 1] := ENLoadSwitchList.list[i].ratedCurrent.DecimalString;
        Cells[6, i + 1] := ENLoadSwitchList.list[i].substation04Name; //ТП 6 - 10 / 0,4 кВ
        Cells[7, i + 1] := ENLoadSwitchList.list[i].highvoltageSellNumberGen; //Номер Високовольтної Ланки
        LastRow := i + 1;
        sgENLoadSwitch.RowCount:=LastRow+1;
      end;

   sgENLoadSwitch.Row := 1;
  end;
  //// end LOADSWITCH

  // start  tsSubst150Disconnector   ---------------
  if (PageControl.ActivePage = tsSubst150Disconnector) then
  begin
    ClearGrid(sgENSubst150Disconnector);

    TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;

    disconnectorFilter := ENSubst150DisconnectorFilter.Create;
    SetNullIntProps(disconnectorFilter);
    SetNullXSProps(disconnectorFilter);

    disconnectorFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    disconnectorFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    disconnectorList := TempENSubst150Disconnector.getScrollableFilteredList(ENSubst150DisconnectorFilter(disconnectorFilter),0,-1);

    LastCount:=High(disconnectorList.list);

    if LastCount > -1 then
       sgENSubst150Disconnector.RowCount:=LastCount+2
    else
       sgENSubst150Disconnector.RowCount:=2;

     with sgENSubst150Disconnector do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if disconnectorList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(disconnectorList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := disconnectorList.list[i].name;
          Cells[2,i+1] := disconnectorList.list[i].factoryNumber;

          Cells[3,i+1] := disconnectorList.list[i].typeRefName;

          if disconnectorList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := disconnectorList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := disconnectorList.list[i].commentGen;
          //Cells[5,i+1] := disconnectorList.list[i].userGen;

          LastRow:=i+1;
          sgENSubst150Disconnector.RowCount:=LastRow+1;
        end;

     sgENSubst150Disconnector.Row:=1;
  end;
  // end  tsSubst150Disconnector   ---------------


  // start  tsSubst150TireSection   ---------------
  if (PageControl.ActivePage = tsSubst150TireSection) then
  begin
    ClearGrid(sgENSubst150TireSection);

    TempENSubst150TireSection :=  HTTPRIOENSubst150TireSection as ENSubst150TireSectionControllerSoapPort;

    TireSectionFilter := ENSubst150TireSectionFilter.Create;
    SetNullIntProps(TireSectionFilter);
    SetNullXSProps(TireSectionFilter);
    TireSectionFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    TireSectionFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    TireSectionList := TempENSubst150TireSection.getScrollableFilteredList(TireSectionFilter,0,-1);
    LastCount:=High(TireSectionList.list);

    if LastCount > -1 then
       sgENSubst150TireSection.RowCount:=LastCount+2
    else
       sgENSubst150TireSection.RowCount:=2;

     with sgENSubst150TireSection do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if TireSectionList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TireSectionList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := TireSectionList.list[i].name;
          Cells[2,i+1] := TireSectionList.list[i].factoryNumber;
          Cells[3,i+1] := TireSectionList.list[i].typeRefName;
          if TireSectionList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := TireSectionList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := TireSectionList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150TireSection.RowCount:=LastRow+1;
        end;

     sgENSubst150TireSection.Row:=1;
  end;
  // end  tsSubst150TireSection   ---------------


  // start  enarrester   ---------------
  if (PageControl.ActivePage = tsSubst150Arrester) then
  begin
      FormatSettings.DecimalSeparator := '.';
      ClearGrid(sgENArrester);
      SetGridHeaders(ENArresterHeaders, sgENArrester.ColumnHeaders);

      TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;

      arresterfilter := ENArresterFilter.Create;
      SetNullIntProps(arresterfilter);
      SetNullXSProps(arresterfilter);

      arresterfilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
      arresterfilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;


      ENArresterList := TempENArrester.getScrollableFilteredList(arresterfilter, 0, -1);

      LastCount := High(ENArresterList.list);

      if LastCount > -1 then
         sgENArrester.RowCount := LastCount + 2
      else
         sgENArrester.RowCount := 2;

       with sgENArrester do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENArresterList.list[i].code <> Low(Integer) then
              Cells[0, i + 1] := IntToStr(ENArresterList.list[i].code)
            else //Код Разрядника
              Cells[0, i + 1] := '';
            Cells[1, i + 1] := ENArresterList.list[i].materialRefName; //Разрядник из Нормативных материалов
            Cells[2, i + 1] := ENArresterList.list[i].name; //Диспетчерское название
            Cells[3, i + 1] := ENArresterList.list[i].arresterSiteName; //Место установки
            Cells[4, i + 1] := ENArresterList.list[i].substation04Name; //Трансформаторная Подстанция 6 - 10 / 0,4 кВ
            Cells[5, i + 1] := ENArresterList.list[i].highvoltageSellNumberGen; //№ Высоковольтной Ячейки
            LastRow := i + 1;
            sgENArrester.RowCount := LastRow + 1;
          end;

       sgENArrester.Row := 1;
  end;
  // end enarrester


  // start  tsSubst150TransformerMeasure   ---------------
  if ( PageControl.ActivePage = tsSubst150TransformerMeasure) then
  begin
    ClearGrid(sgENSubst150TransformerMeasure);

    TempENSubst150TransformerMeasure :=  HTTPRIOENSubst150TransformerMeasure as ENSubst150TransformerMeasureControllerSoapPort;

    TransformerMeasureFilter := ENSubst150TransformerMeasureFilter.Create;
    SetNullIntProps(TransformerMeasureFilter);
    SetNullXSProps(TransformerMeasureFilter);
    TransformerMeasureFilter.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    TransformerMeasureFilter.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    TransformerMeasureList := TempENSubst150TransformerMeasure.getScrollableFilteredList(TransformerMeasureFilter,0,-1);
    LastCount:=High(TransformerMeasureList.list);

    if LastCount > -1 then
       sgENSubst150TransformerMeasure.RowCount:=LastCount+2
    else
       sgENSubst150TransformerMeasure.RowCount:=2;

     with sgENSubst150TransformerMeasure do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if TransformerMeasureList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TransformerMeasureList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := TransformerMeasureList.list[i].name;
          Cells[2,i+1] := TransformerMeasureList.list[i].factoryNumber;
          Cells[3,i+1] := TransformerMeasureList.list[i].typeRefName;
          if TransformerMeasureList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := TransformerMeasureList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := TransformerMeasureList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150TransformerMeasure.RowCount:=LastRow+1;
        end;

     sgENSubst150TransformerMeasure.Row:=1;
  end;
  // end  tsSubst150TransformerMeasure   ---------------
end;

procedure TfrmENSubst150VRUZRUEdit.actDeleteExecute(Sender: TObject);
var
objCode : Integer;
TempENSubst150Grounding : ENSubst150GroundingControllerSoapPort;
TempENSubst150CABLECHANNEL : ENSubst150CABLECHANNELControllerSoapPort;
TempENSubst150BUILDZRU : ENSubst150BuildZruControllerSoapPort;
TempENSubst150BuildingAdditional : ENSubst150BuildingAdditionalControllerSoapPort;
TempENSubst150OilCollecting : ENSubst150OilCollectingControllerSoapPort;
TempENSubst150ExternalFence : ENSubst150ExternalFenceControllerSoapPort;
TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
TempENSubst150TireSection : ENSubst150TireSectionControllerSoapPort;
TempENArrester: ENArresterControllerSoapPort;
TempENSubst150TransformerMeasure : ENSubst150TransformerMeasureControllerSoapPort;
begin
  // start  tsSubst150Grounding   ---------------
  if (PageControl.ActivePage = tsSubst150Grounding) then
  begin
    TempENSubst150Grounding := HTTPRIOENSubst150Grounding as ENSubst150GroundingControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150Grounding.Cells[0,sgENSubst150Grounding.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Грозозащиту ПС контур заземления) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150Grounding.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150Grounding   ---------------

  // start  tsSubst150CABLECHANNEL   ---------------
  if (PageControl.ActivePage = tsSubst150CABLECHANNEL) then
  begin
    TempENSubst150CABLECHANNEL := HTTPRIOENSubst150CABLECHANNEL as ENSubst150CABLECHANNELControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150CABLECHANNEL.Cells[0,sgENSubst150CABLECHANNEL.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Кабельный канал) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150CABLECHANNEL.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150CABLECHANNEL   ---------------

  // start  tsSubst150BuildZru   ---------------
  if (PageControl.ActivePage = tsSubst150BuildZru) then
  begin
    TempENSubst150BuildZru := HTTPRIOENSubst150BuildZru as ENSubst150BuildZruControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150BuildZru.Cells[0,sgENSubst150BuildZru.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Здания ЗРУ) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150BuildZru.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150BuildZru   ---------------

  // start  tsSubst150BuildingAdditional   ---------------
  if (PageControl.ActivePage = tsSubst150BuildingAdditional) then
  begin
    TempENSubst150BuildingAdditional := HTTPRIOENSubst150BuildingAdditional as ENSubst150BuildingAdditionalControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150BuildingAdditional.Cells[0,sgENSubst150BuildingAdditional.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Дополнительные здания) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150BuildingAdditional.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150BuildingAdditional   ---------------

  // start  tsSubst150OilCollecting   ---------------
  if (PageControl.ActivePage = tsSubst150OilCollecting) then
  begin
    TempENSubst150OilCollecting := HTTPRIOENSubst150OilCollecting as ENSubst150OilCollectingControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150OilCollecting.Cells[0,sgENSubst150OilCollecting.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Маслосборные конструкции) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150OilCollecting.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150OilCollecting   ---------------

  // start  tsSubst150ExternalFence   ---------------
  if (PageControl.ActivePage = tsSubst150ExternalFence) then
  begin
    TempENSubst150ExternalFence := HTTPRIOENSubst150ExternalFence as ENSubst150ExternalFenceControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150ExternalFence.Cells[0,sgENSubst150ExternalFence.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Внешнее ограждение) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150ExternalFence.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150ExternalFence   ---------------


  // start  tsSubst150Grounding   ---------------
  if (PageControl.ActivePage = tsSubst150LOADSWITCH) then
  begin
      TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLoadSwitch.Cells[0,sgENLoadSwitch.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Выключатель нагрузки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLoadSwitch.remove(ObjCode);
      PageControlChange(Sender);
  end;
  end;
  // end  tsSubst150Grounding   ---------------

  // start  tsSubst150Disconnector   ---------------
  if (PageControl.ActivePage = tsSubst150Disconnector) then
  begin
    TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150Disconnector.Cells[0,sgENSubst150Disconnector.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Разъединитель) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150Disconnector.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150Disconnector   ---------------



  // start  tsSubst150TireSection   ---------------
  if (PageControl.ActivePage = tsSubst150TireSection) then
  begin
    TempENSubst150TireSection := HTTPRIOENSubst150TireSection as ENSubst150TireSectionControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150TireSection.Cells[0,sgENSubst150TireSection.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Секция шин) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150TireSection.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150TireSection   ---------------

  // start  tsSubst150Arrester  ---------------
  if (PageControl.ActivePage = tsSubst150Arrester) then
  begin
     TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;
     try
       ObjCode := StrToInt(sgENArrester.Cells[0,sgENArrester.Row]);
     except
     on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Разрядник) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENArrester.remove(ObjCode);
        PageControlChange(Sender);
    end;
  end;


  // start  tsSubst150TransformerMeasure   ---------------
  if (PageControl.ActivePage = tsSubst150TransformerMeasure) then
  begin
    TempENSubst150TransformerMeasure := HTTPRIOENSubst150TransformerMeasure as ENSubst150TransformerMeasureControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150TransformerMeasure.Cells[0,sgENSubst150TransformerMeasure.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Измерительные трансформаторы) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150TransformerMeasure.remove(objCode);
        PageControlChange(Sender);
    end;
  end;
  // end  tsSubst150TransformerMeasure   ---------------
end;

procedure TfrmENSubst150VRUZRUEdit.actEditExecute(Sender: TObject);
var
TempENSubst150Grounding : ENSubst150GroundingControllerSoapPort;
TempENSubst150CABLECHANNEL : ENSubst150CABLECHANNELControllerSoapPort;
TempENSubst150BUILDZRU : ENSubst150BUILDZRUControllerSoapPort;
TempENSubst150BuildingAdditional : ENSubst150BuildingAdditionalControllerSoapPort;
TempENSubst150OilCollecting : ENSubst150OilCollectingControllerSoapPort;
TempENSubst150ExternalFence : ENSubst150ExternalFenceControllerSoapPort;
TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
TempENSubst150TireSection: ENSubst150TireSectionControllerSoapPort;
TempENArrester: ENArresterControllerSoapPort;
TempENSubst150TransformerMeasure : ENSubst150TransformerMeasureControllerSoapPort;
begin
  inherited;
   // start  tsSubst150Grounding   ---------------
  if (PageControl.ActivePage = tsSubst150Grounding) then
  begin
    TempENSubst150Grounding := HTTPRIOENSubst150Grounding as ENSubst150GroundingControllerSoapPort;
    try
      ENSubst150GroundingObj := TempENSubst150Grounding.getObject(StrToInt(sgENSubst150Grounding.Cells[0,sgENSubst150Grounding.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150GroundingEdit := TfrmENSubst150GroundingEdit.Create(Application, dsEdit);
    try
      if frmENSubst150GroundingEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150GroundingEdit.Free;
      frmENSubst150GroundingEdit:=nil;
    end;
  end;
  // end  tsSubst150Grounding   ---------------

  // start  tsSubst150CABLECHANNEL   ---------------
  if (PageControl.ActivePage = tsSubst150CABLECHANNEL) then
  begin
    TempENSubst150CABLECHANNEL := HTTPRIOENSubst150CABLECHANNEL as ENSubst150CABLECHANNELControllerSoapPort;
    try
      ENSubst150CABLECHANNELObj := TempENSubst150CABLECHANNEL.getObject(StrToInt(sgENSubst150CABLECHANNEL.Cells[0,sgENSubst150CABLECHANNEL.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150CABLECHANNELEdit := TfrmENSubst150CABLECHANNELEdit.Create(Application, dsEdit);
    try
      if frmENSubst150CABLECHANNELEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150CABLECHANNELEdit.Free;
      frmENSubst150CABLECHANNELEdit:=nil;
    end;
  end;
  // end  tsSubst150CABLECHANNEL   ---------------

  // start  tsSubst150BuildZru   ---------------
  if (PageControl.ActivePage = tsSubst150BuildZru) then
  begin
    TempENSubst150BuildZru := HTTPRIOENSubst150BuildZru as ENSubst150BuildZruControllerSoapPort;
    try
      ENSubst150BuildZruObj := TempENSubst150BuildZru.getObject(StrToInt(sgENSubst150BuildZru.Cells[0,sgENSubst150BuildZru.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150BuildZruEdit := TfrmENSubst150BuildZruEdit.Create(Application, dsEdit);
    try
      if frmENSubst150BuildZruEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150BuildZruEdit.Free;
      frmENSubst150BuildZruEdit:=nil;
    end;
  end;
  // end  tsSubst150BuildZru   ---------------

  // start  tsSubst150BuildingAdditional   ---------------
  if (PageControl.ActivePage = tsSubst150BuildingAdditional) then
  begin
    TempENSubst150BuildingAdditional := HTTPRIOENSubst150BuildingAdditional as ENSubst150BuildingAdditionalControllerSoapPort;
    try
      ENSubst150BuildingAdditionalObj := TempENSubst150BuildingAdditional.getObject(StrToInt(sgENSubst150BuildingAdditional.Cells[0,sgENSubst150BuildingAdditional.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150BuildingAdditionalEdit := TfrmENSubst150BuildingAdditionalEdit.Create(Application, dsEdit);
    try
      if frmENSubst150BuildingAdditionalEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150BuildingAdditionalEdit.Free;
      frmENSubst150BuildingAdditionalEdit:=nil;
    end;
  end;
  // end  tsSubst150BuildingAdditional   ---------------

  // start  tsSubst150OilCollecting   ---------------
  if (PageControl.ActivePage = tsSubst150OilCollecting) then
  begin
    TempENSubst150OilCollecting := HTTPRIOENSubst150OilCollecting as ENSubst150OilCollectingControllerSoapPort;
    try
      ENSubst150OilCollectingObj := TempENSubst150OilCollecting.getObject(StrToInt(sgENSubst150OilCollecting.Cells[0,sgENSubst150OilCollecting.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150OilCollectingEdit := TfrmENSubst150OilCollectingEdit.Create(Application, dsEdit);
    try
      if frmENSubst150OilCollectingEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150OilCollectingEdit.Free;
      frmENSubst150OilCollectingEdit:=nil;
    end;
  end;
  // end  tsSubst150OilCollecting   ---------------

  // start  tsSubst150ExternalFence   ---------------
  if (PageControl.ActivePage = tsSubst150ExternalFence) then
  begin
    TempENSubst150ExternalFence := HTTPRIOENSubst150ExternalFence as ENSubst150ExternalFenceControllerSoapPort;
    try
      ENSubst150ExternalFenceObj := TempENSubst150ExternalFence.getObject(StrToInt(sgENSubst150ExternalFence.Cells[0,sgENSubst150ExternalFence.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150ExternalFenceEdit := TfrmENSubst150ExternalFenceEdit.Create(Application, dsEdit);
    try
      if frmENSubst150ExternalFenceEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150ExternalFenceEdit.Free;
      frmENSubst150ExternalFenceEdit:=nil;
    end;
  end;
  // end  tsSubst150ExternalFence   ---------------

  // start  tsSubst150LOADSWITCH   ---------------
  if (PageControl.ActivePage = tsSubst150LOADSWITCH) then
  begin
         TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
       try
         ENLoadSwitchObj := TempENLoadSwitch.getObject(StrToInt(sgENLoadSwitch.Cells[0,sgENLoadSwitch.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENLoadSwitchEdit:=TfrmENLoadSwitchEdit.Create(Application, dsEdit);
      try
        if frmENLoadSwitchEdit.ShowModal= mrOk then
          begin
            PageControlChange(Sender);
          end;
      finally
        frmENLoadSwitchEdit.Free;
        frmENLoadSwitchEdit:=nil;
      end;
  end;
  // end  tsSubst150LOADSWITCH   ---------------

  // start  tsSubst150Disconnector   ---------------
  if (PageControl.ActivePage = tsSubst150Disconnector) then
  begin
    TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
    try
      ENSubst150DisconnectorObj := TempENSubst150Disconnector.getObject(StrToInt(sgENSubst150Disconnector.Cells[0,sgENSubst150Disconnector.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150DisconnectorEdit := TfrmENSubst150DisconnectorEdit.Create(Application, dsEdit);
    try
      if frmENSubst150DisconnectorEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150DisconnectorEdit.Free;
      frmENSubst150DisconnectorEdit:=nil;
    end;
  end;
  // end  tsSubst150Disconnector   ---------------


  // start  tsSubst150TireSection   ---------------
  if (PageControl.ActivePage = tsSubst150TireSection) then
  begin
    TempENSubst150TireSection := HTTPRIOENSubst150TireSection as ENSubst150TireSectionControllerSoapPort;
    try
      ENSubst150TireSectionObj := TempENSubst150TireSection.getObject(StrToInt(sgENSubst150TireSection.Cells[0,sgENSubst150TireSection.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150TireSectionEdit := TfrmENSubst150TireSectionEdit.Create(Application, dsEdit);
    try
      if frmENSubst150TireSectionEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150TireSectionEdit.Free;
      frmENSubst150TireSectionEdit:=nil;
    end;
  end;
  // end  tsSubst150TireSection   ---------------

  // start  tsSubst150Arrester   ---------------
  if (PageControl.ActivePage = tsSubst150Arrester) then
  begin
      TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;
     try
       ENArresterObj := TempENArrester.getObject(StrToInt(sgENArrester.Cells[0,sgENArrester.Row]));
     except
     on EConvertError do Exit;
    end;
    frmENArresterEdit:=TfrmENArresterEdit.Create(Application, dsEdit);
    try
      if frmENArresterEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENArresterEdit.Free;
      frmENArresterEdit:=nil;
    end;
  end;

  // start  tsSubst150TransformerMeasure   ---------------
  if (PageControl.ActivePage = tsSubst150TransformerMeasure) then
  begin
    TempENSubst150TransformerMeasure := HTTPRIOENSubst150TransformerMeasure as ENSubst150TransformerMeasureControllerSoapPort;
    try
      ENSubst150TransformerMeasureObj := TempENSubst150TransformerMeasure.getObject(StrToInt(sgENSubst150TransformerMeasure.Cells[0,sgENSubst150TransformerMeasure.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150TransformerMeasureEdit := TfrmENSubst150TransformerMeasureEdit.Create(Application, dsEdit);
    try
      if frmENSubst150TransformerMeasureEdit.ShowModal= mrOk then
        begin
          PageControlChange(Sender);
        end;
    finally
      frmENSubst150TransformerMeasureEdit.Free;
      frmENSubst150TransformerMeasureEdit:=nil;
    end;
  end;
  // end  tsSubst150TransformerMeasure   ---------------

end;

procedure TfrmENSubst150VRUZRUEdit.actInsertExecute(Sender: TObject);
begin
  inherited;
   // start  tsSubst150Grounding   ---------------
  if PageControl.ActivePage = tsSubst150Grounding then
  begin
    ENSubst150GroundingObj := ENSubst150Grounding.Create;
    ENSubst150GroundingObj.substation150Ref := ENSubstation150Ref.Create;
    ENSubst150GroundingObj.substation150Ref.code := ENSubst150VRUZRUObj.substationRef.code;

    ENSubst150GroundingObj.subst150VruZruRef:= ENSubst150VRUZRURef.Create;
    ENSubst150GroundingObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;
    try
      frmENSubst150GroundingEdit := TfrmENSubst150GroundingEdit.Create(Application, dsInsert);
      try
        if frmENSubst150GroundingEdit.ShowModal = mrOk then
        begin
          if ENSubst150GroundingObj <> nil then
           PageControlChange(Sender);
        end;
      finally
        frmENSubst150GroundingEdit.Free;
        frmENSubst150GroundingEdit:=nil;
      end;
    finally
      ENSubst150GroundingObj.Free;
    end;
  end;
  // end  tsSubst150Grounding   ---------------

   // start  tsSubst150CABLECHANNEL   ---------------
  if PageControl.ActivePage = tsSubst150CABLECHANNEL then
  begin
    ENSubst150CABLECHANNELObj := ENSubst150CABLECHANNEL.Create;
    ENSubst150CABLECHANNELObj.substation150Ref := ENSubstation150Ref.Create;
    ENSubst150CABLECHANNELObj.substation150Ref.code := ENSubst150VRUZRUObj.substationRef.code;

    ENSubst150CABLECHANNELObj.subst150VruZruRef:= ENSubst150VRUZRURef.Create;
    ENSubst150CABLECHANNELObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;
    try
      frmENSubst150CABLECHANNELEdit := TfrmENSubst150CABLECHANNELEdit.Create(Application, dsInsert);
      try
        if frmENSubst150CABLECHANNELEdit.ShowModal = mrOk then
        begin
          if ENSubst150CABLECHANNELObj <> nil then
           PageControlChange(Sender);
        end;
      finally
        frmENSubst150CABLECHANNELEdit.Free;
        frmENSubst150CABLECHANNELEdit:=nil;
      end;
    finally
      ENSubst150CABLECHANNELObj.Free;
    end;
  end;
  // end  tsSubst150CABLECHANNEL   ---------------

  // start  tsSubst150BuildZru   ---------------
  if PageControl.ActivePage = tsSubst150BuildZru then
  begin
    ENSubst150BuildZruObj := ENSubst150BuildZru.Create;
    ENSubst150BuildZruObj.substation150Ref := ENSubstation150Ref.Create;
    ENSubst150BuildZruObj.substation150Ref.code := ENSubst150VRUZRUObj.substationRef.code;

    ENSubst150BuildZruObj.subst150VruZruRef:= ENSubst150VRUZRURef.Create;
    ENSubst150BuildZruObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;
    try
      frmENSubst150BuildZruEdit := TfrmENSubst150BuildZruEdit.Create(Application, dsInsert);
      try
        if frmENSubst150BuildZruEdit.ShowModal = mrOk then
        begin
          if ENSubst150BuildZruObj <> nil then
           PageControlChange(Sender);
        end;
      finally
        frmENSubst150BuildZruEdit.Free;
        frmENSubst150BuildZruEdit:=nil;
      end;
    finally
      ENSubst150BuildZruObj.Free;
    end;
  end;
  // end  tsSubst150BuildZru   ---------------

  // start  tsSubst150BuildingAdditional   ---------------
  if PageControl.ActivePage = tsSubst150BuildingAdditional then
  begin
    ENSubst150BuildingAdditionalObj := ENSubst150BuildingAdditional.Create;
    ENSubst150BuildingAdditionalObj.substation150Ref := ENSubstation150Ref.Create;
    ENSubst150BuildingAdditionalObj.substation150Ref.code := ENSubst150VRUZRUObj.substationRef.code;

    ENSubst150BuildingAdditionalObj.subst150VruZruRef:= ENSubst150VRUZRURef.Create;
    ENSubst150BuildingAdditionalObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;
    try
      frmENSubst150BuildingAdditionalEdit := TfrmENSubst150BuildingAdditionalEdit.Create(Application, dsInsert);
      try
        if frmENSubst150BuildingAdditionalEdit.ShowModal = mrOk then
        begin
          if ENSubst150BuildingAdditionalObj <> nil then
           PageControlChange(Sender);
        end;
      finally
        frmENSubst150BuildingAdditionalEdit.Free;
        frmENSubst150BuildingAdditionalEdit:=nil;
      end;
    finally
      ENSubst150BuildingAdditionalObj.Free;
    end;
  end;
  // end  tsSubst150BuildingAdditional   ---------------


  // start  tsSubst150OilCollecting   ---------------
  if PageControl.ActivePage = tsSubst150OilCollecting then
  begin
    ENSubst150OilCollectingObj := ENSubst150OilCollecting.Create;
    ENSubst150OilCollectingObj.substation150Ref := ENSubstation150Ref.Create;
    ENSubst150OilCollectingObj.substation150Ref.code := ENSubst150VRUZRUObj.substationRef.code;

    ENSubst150OilCollectingObj.subst150VruZruRef:= ENSubst150VRUZRURef.Create;
    ENSubst150OilCollectingObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;
    try
      frmENSubst150OilCollectingEdit := TfrmENSubst150OilCollectingEdit.Create(Application, dsInsert);
      try
        if frmENSubst150OilCollectingEdit.ShowModal = mrOk then
        begin
          if ENSubst150OilCollectingObj <> nil then
           PageControlChange(Sender);
        end;
      finally
        frmENSubst150OilCollectingEdit.Free;
        frmENSubst150OilCollectingEdit:=nil;
      end;
    finally
      ENSubst150OilCollectingObj.Free;
    end;
  end;
  // end  tsSubst150OilCollecting   ---------------

  // start  tsSubst150ExternalFence   ---------------
  if PageControl.ActivePage = tsSubst150ExternalFence then
  begin
    ENSubst150ExternalFenceObj := ENSubst150ExternalFence.Create;
    ENSubst150ExternalFenceObj.substation150Ref := ENSubstation150Ref.Create;
    ENSubst150ExternalFenceObj.substation150Ref.code := ENSubst150VRUZRUObj.substationRef.code;

    ENSubst150ExternalFenceObj.subst150VruZruRef:= ENSubst150VRUZRURef.Create;
    ENSubst150ExternalFenceObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;
    try
      frmENSubst150ExternalFenceEdit := TfrmENSubst150ExternalFenceEdit.Create(Application, dsInsert);
      try
        if frmENSubst150ExternalFenceEdit.ShowModal = mrOk then
        begin
          if ENSubst150ExternalFenceObj <> nil then
           PageControlChange(Sender);
        end;
      finally
        frmENSubst150ExternalFenceEdit.Free;
        frmENSubst150ExternalFenceEdit:=nil;
      end;
    finally
      ENSubst150ExternalFenceObj.Free;
    end;
  end;
  // end  tsSubst150ExternalFence   ---------------


  // start  tsSubst150ENLOADSWITCH   ---------------
  if PageControl.ActivePage = tsSubst150LOADSWITCH then
  begin
    ENLOADSWITCHObj := ENLOADSWITCH.Create;
    ENLOADSWITCHObj.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    ENLOADSWITCHObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;

    //TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;


      try
        frmENLoadSwitchEdit:=TfrmENLoadSwitchEdit.Create(Application, dsInsert);
        try
          if frmENLoadSwitchEdit.ShowModal = mrOk then
          begin
            if ENLoadSwitchObj<>nil then
                PageControlChange(Sender);
          end;
        finally
          frmENLoadSwitchEdit.Free;
          frmENLoadSwitchEdit:=nil;
        end;
      finally
        ENLoadSwitchObj.Free;
      end;
  end;
  // end  tsSubst150ENLOADSWITCH   ---------------


  // start  tsSubst150Disconnector   ---------------
  if (PageControl.ActivePage = tsSubst150Disconnector) then
  begin
    ENSubst150DisconnectorObj := ENSubst150Disconnector.Create;
    ENSubst150DisconnectorObj.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    ENSubst150DisconnectorObj.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    try
      frmENSubst150DisconnectorEdit := TfrmENSubst150DisconnectorEdit.Create(Application, dsInsert);
      try
        if frmENSubst150DisconnectorEdit.ShowModal = mrOk then
        begin
          if ENSubst150DisconnectorObj <> nil then
            PageControlChange(Sender);
        end;
      finally
        frmENSubst150DisconnectorEdit.Free;
        frmENSubst150DisconnectorEdit:=nil;
      end;
    finally
      ENSubst150DisconnectorObj.Free;
    end;
  end;
  // end  tsSubst150Disconnector   ---------------


  // start  tsSubst150TireSection   ---------------
  if (PageControl.ActivePage = tsSubst150TireSection) then
  begin
    ENSubst150TireSectionObj := ENSubst150TireSection.Create;
    ENSubst150TireSectionObj.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    ENSubst150TireSectionObj.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    try
      frmENSubst150TireSectionEdit := TfrmENSubst150TireSectionEdit.Create(Application, dsInsert);
      try
        if frmENSubst150TireSectionEdit.ShowModal = mrOk then
        begin
          if ENSubst150TireSectionObj <> nil then
             PageControlChange(Sender);
        end;
      finally
        frmENSubst150TireSectionEdit.Free;
        frmENSubst150TireSectionEdit:=nil;
      end;
    finally
      ENSubst150TireSectionObj.Free;
    end;
  end;
  // end  tsSubst150TireSection   ---------------

  // start  tsSubst150Arrester   ---------------
  if (PageControl.ActivePage = tsSubst150Arrester) then
  begin
    ENArresterObj := ENArrester.Create;
    ENArresterObj.subst150VruZruRef := ENSubst150VRUZRURef.Create;
    ENArresterObj.subst150VruZruRef.code := ENSubst150VRUZRUObj.code;

    try
      frmENArresterEdit:=TfrmENArresterEdit.Create(Application, dsInsert);
      try
        if frmENArresterEdit.ShowModal = mrOk then
        begin
          if ENArresterObj<>nil then
              PageControlChange(Sender);
        end;
      finally
        frmENArresterEdit.Free;
        frmENArresterEdit:=nil;
      end;
    finally
      ENArresterObj.Free;
    end;
  end;


  // start  tsSubst150TransformerMeasure   ---------------
  if PageControl.ActivePage = tsSubst150TransformerMeasure then
  begin
    ENSubst150TransformerMeasureObj := ENSubst150TransformerMeasure.Create;
    ENSubst150TransformerMeasureObj.substation150Ref := ENSubstation150Ref.Create;
    ENSubst150TransformerMeasureObj.substation150Ref.code := ENSubst150VRUZRUObj.substationRef.code;

    ENSubst150TransformerMeasureObj.subst150VruZruRef:= ENSubst150VRUZRURef.Create;
    ENSubst150TransformerMeasureObj.subst150VruZruRef.code:= ENSubst150VRUZRUObj.code;
    try
      frmENSubst150TransformerMeasureEdit := TfrmENSubst150TransformerMeasureEdit.Create(Application, dsInsert);
      try
        if frmENSubst150TransformerMeasureEdit.ShowModal = mrOk then
        begin
          if ENSubst150TransformerMeasureObj <> nil then
           PageControlChange(Sender);
        end;
      finally
        frmENSubst150TransformerMeasureEdit.Free;
        frmENSubst150TransformerMeasureEdit:=nil;
      end;
    finally
      ENSubst150TransformerMeasureObj.Free;
    end;
  end;
  // end  tsSubst150TransformerMeasure   ---------------


end;

procedure TfrmENSubst150VRUZRUEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
    PageControlChange(Sender);
end;

procedure TfrmENSubst150VRUZRUEdit.actViewExecute(Sender: TObject);
var
  TempENSubst150Grounding: ENSubst150GroundingControllerSoapPort;
  TempENSubst150CABLECHANNEL : ENSubst150CABLECHANNELControllerSoapPort;
  TempENSubst150BUILDZRU : ENSubst150BUILDZRUControllerSoapPort;
  TempENSubst150BuildingAdditional : ENSubst150BuildingAdditionalControllerSoapPort;
  TempENSubst150OILCOLLECTING : ENSubst150OILCOLLECTINGControllerSoapPort;
  TempENSubst150ExternalFence: ENSubst150ExternalFenceControllerSoapPort;
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
  TempENSubst150TireSection : ENSubst150TireSectionControllerSoapPort;
  TempENArrester: ENArresterControllerSoapPort;
  TempENSubst150TransformerMeasure : ENSubst150TransformerMeasureControllerSoapPort;
begin
  inherited;
     if PageControl.ActivePage = tsSubst150Grounding then
     begin
         TempENSubst150Grounding := HTTPRIOENSubst150Grounding as ENSubst150GroundingControllerSoapPort;
        try
          ENSubst150GroundingObj := TempENSubst150Grounding.getObject(StrToInt(sgENSubst150Grounding.Cells[0, sgENSubst150Grounding.Row]));
        except
          on EConvertError do Exit;
        end;

        frmENSubst150GroundingEdit := TfrmENSubst150GroundingEdit.Create(Application, dsView);
        try
          frmENSubst150GroundingEdit.ShowModal;
        finally
          frmENSubst150GroundingEdit.Free;
          frmENSubst150GroundingEdit := nil;
        end;
     end;

     if PageControl.ActivePage = tsSubst150CABLECHANNEL then
     begin
         TempENSubst150CABLECHANNEL := HTTPRIOENSubst150CABLECHANNEL as ENSubst150CABLECHANNELControllerSoapPort;
        try
          ENSubst150CABLECHANNELObj := TempENSubst150CABLECHANNEL.getObject(StrToInt(sgENSubst150CABLECHANNEL.Cells[0, sgENSubst150CABLECHANNEL.Row]));
        except
          on EConvertError do Exit;
        end;

        frmENSubst150CABLECHANNELEdit := TfrmENSubst150CABLECHANNELEdit.Create(Application, dsView);
        try
          frmENSubst150CABLECHANNELEdit.ShowModal;
        finally
          frmENSubst150CABLECHANNELEdit.Free;
          frmENSubst150CABLECHANNELEdit := nil;
        end;
     end;

     if PageControl.ActivePage = tsSubst150BuildZru then
     begin
         TempENSubst150BuildZru := HTTPRIOENSubst150BuildZru as ENSubst150BuildZruControllerSoapPort;
        try
          ENSubst150BuildZruObj := TempENSubst150BuildZru.getObject(StrToInt(sgENSubst150BuildZru.Cells[0, sgENSubst150BuildZru.Row]));
        except
          on EConvertError do Exit;
        end;

        frmENSubst150BuildZruEdit := TfrmENSubst150BuildZruEdit.Create(Application, dsView);
        try
          frmENSubst150BuildZruEdit.ShowModal;
        finally
          frmENSubst150BuildZruEdit.Free;
          frmENSubst150BuildZruEdit := nil;
        end;
     end;

     if PageControl.ActivePage = tsSubst150BuildingAdditional then
     begin
         TempENSubst150BuildingAdditional := HTTPRIOENSubst150BuildingAdditional as ENSubst150BuildingAdditionalControllerSoapPort;
        try
          ENSubst150BuildingAdditionalObj := TempENSubst150BuildingAdditional.getObject(StrToInt(sgENSubst150BuildingAdditional.Cells[0, sgENSubst150BuildingAdditional.Row]));
        except
          on EConvertError do Exit;
        end;

        frmENSubst150BuildingAdditionalEdit := TfrmENSubst150BuildingAdditionalEdit.Create(Application, dsView);
        try
          frmENSubst150BuildingAdditionalEdit.ShowModal;
        finally
          frmENSubst150BuildingAdditionalEdit.Free;
          frmENSubst150BuildingAdditionalEdit := nil;
        end;
     end;

     if PageControl.ActivePage = tsSubst150OilCollecting then
     begin
         TempENSubst150OilCollecting := HTTPRIOENSubst150OilCollecting as ENSubst150OilCollectingControllerSoapPort;
        try
          ENSubst150OilCollectingObj := TempENSubst150OilCollecting.getObject(StrToInt(sgENSubst150OilCollecting.Cells[0, sgENSubst150OilCollecting.Row]));
        except
          on EConvertError do Exit;
        end;

        frmENSubst150OilCollectingEdit := TfrmENSubst150OilCollectingEdit.Create(Application, dsView);
        try
          frmENSubst150OilCollectingEdit.ShowModal;
        finally
          frmENSubst150OilCollectingEdit.Free;
          frmENSubst150OilCollectingEdit := nil;
        end;
     end;

     if PageControl.ActivePage = tsSubst150ExternalFence then
     begin
         TempENSubst150ExternalFence := HTTPRIOENSubst150ExternalFence as ENSubst150ExternalFenceControllerSoapPort;
        try
          ENSubst150ExternalFenceObj := TempENSubst150ExternalFence.getObject(StrToInt(sgENSubst150ExternalFence.Cells[0, sgENSubst150ExternalFence.Row]));
        except
          on EConvertError do Exit;
        end;

        frmENSubst150ExternalFenceEdit := TfrmENSubst150ExternalFenceEdit.Create(Application, dsView);
        try
          frmENSubst150ExternalFenceEdit.ShowModal;
        finally
          frmENSubst150ExternalFenceEdit.Free;
          frmENSubst150ExternalFenceEdit := nil;
        end;
     end;

     if PageControl.ActivePage = tsSubst150LOADSWITCH then
     begin
        TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
       try
         ENLoadSwitchObj := TempENLoadSwitch.getObject(StrToInt(sgENLoadSwitch.Cells[0,sgENLoadSwitch.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENLoadSwitchEdit:=TfrmENLoadSwitchEdit.Create(Application, dsView);
      try
              frmENLoadSwitchEdit.ShowModal;
            finally
              frmENLoadSwitchEdit.Free;
              frmENLoadSwitchEdit:=nil;
        end;
     end;


     // start  tsSubst150Disconnector   ---------------
  if (PageControl.ActivePage = tsSubst150Disconnector) then
  begin
    TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;
    try
      ENSubst150DisconnectorObj := TempENSubst150Disconnector.getObject(StrToInt(sgENSubst150Disconnector.Cells[0,sgENSubst150Disconnector.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150DisconnectorEdit := TfrmENSubst150DisconnectorEdit.Create(Application, dsView);
    try
      frmENSubst150DisconnectorEdit.ShowModal;
    finally
      frmENSubst150DisconnectorEdit.Free;
      frmENSubst150DisconnectorEdit:=nil;
    end;
  end;
  // end  tsSubst150Disconnector   ---------------

  // start  tsSubst150TireSection   ---------------
  if (PageControl.ActivePage = tsSubst150TireSection) then
  begin
    TempENSubst150TireSection := HTTPRIOENSubst150TireSection as ENSubst150TireSectionControllerSoapPort;
    try
      ENSubst150TireSectionObj := TempENSubst150TireSection.getObject(StrToInt(sgENSubst150TireSection.Cells[0,sgENSubst150TireSection.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150TireSectionEdit := TfrmENSubst150TireSectionEdit.Create(Application, dsView);
    try
      frmENSubst150TireSectionEdit.ShowModal;
    finally
      frmENSubst150TireSectionEdit.Free;
      frmENSubst150TireSectionEdit:=nil;
    end;

  end;
  // end  tsSubst150TireSection   ---------------

   // start  tsSubst150Arrester   ---------------
  if PageControl.ActivePage = tsSubst150Arrester then
     begin
       TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;
         try
           ENArresterObj := TempENArrester.getObject(StrToInt(sgENArrester.Cells[0,sgENArrester.Row]));
         except
         on EConvertError do Exit;
        end;
        frmENArresterEdit:=TfrmENArresterEdit.Create(Application, dsView);
        try
          frmENArresterEdit.ShowModal;
        finally
          frmENArresterEdit.Free;
          frmENArresterEdit:=nil;
  end;
     end;
        // end  tsSubst150Arrester   ---------------


        if PageControl.ActivePage = tsSubst150TransformerMeasure then
     begin
         TempENSubst150TransformerMeasure := HTTPRIOENSubst150TransformerMeasure as ENSubst150TransformerMeasureControllerSoapPort;
        try
          ENSubst150TransformerMeasureObj := TempENSubst150TransformerMeasure.getObject(StrToInt(sgENSubst150TransformerMeasure.Cells[0, sgENSubst150TransformerMeasure.Row]));
        except
          on EConvertError do Exit;
        end;

        frmENSubst150TransformerMeasureEdit := TfrmENSubst150TransformerMeasureEdit.Create(Application, dsView);
        try
          frmENSubst150TransformerMeasureEdit.ShowModal;
        finally
          frmENSubst150TransformerMeasureEdit.Free;
          frmENSubst150TransformerMeasureEdit := nil;
        end;
     end;

end;

procedure TfrmENSubst150VRUZRUEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150VRUZRU: ENSubst150VRUZRUControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNameDisp
      ,edtName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENSubst150VRUZRU := HTTPRIOENSubst150VRUZRU as ENSubst150VRUZRUControllerSoapPort;

    ENSubst150VRUZRUObj.nameDisp := edtNameDisp.Text; 
    ENSubst150VRUZRUObj.name := edtName.Text; 
    ENSubst150VRUZRUObj.installDate := GetTXSDateFromTDateTimePicker(edtInstallDate);
    ENSubst150VRUZRUObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENSubst150VRUZRUObj.code := Low(Integer);
      TempENSubst150VRUZRU.add(ENSubst150VRUZRUObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150VRUZRU.save(ENSubst150VRUZRUObj);
    end;
  end;
end;


procedure TfrmENSubst150VRUZRUEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150VRUZRUObj.element = nil then ENSubst150VRUZRUObj.element := ENElement.Create();
               ENSubst150VRUZRUObj.element.code := StrToInt(GetReturnValue(sgENElement,0));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


end.
