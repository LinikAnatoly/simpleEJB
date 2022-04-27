
unit EditENSubst150Cell;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSubst150CellController,
    ExtCtrls, AdvObj, TB2Item, TB2Dock, TB2Toolbar;

type
    TfrmENSubst150CellEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;

    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENSubst150Cell: THTTPRIO;
    pcENSubst150Cell: TPageControl;
    tsENSubst150: TTabSheet;
    lblName: TLabel;
    edtName: TEdit;
    lblFactoryNumber: TLabel;
    edtFactoryNumber: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    tsSubst150Switch: TTabSheet;
    tsSubst150CurrentTrans: TTabSheet;
    tsSubst150Disconnector: TTabSheet;
    tsSubst150Discharger: TTabSheet;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENSubst150Switch: TAdvStringGrid;
    HTTPRIOENSubst150Switch: THTTPRIO;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lnlVoltageClass: TLabel;
    edtVoltageClass: TEdit;
    spbVoltageClass: TSpeedButton;
    HTTPRIOENVoltageClass: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgENSubst150CurrentTrans: TAdvStringGrid;
    HTTPRIOENSubst150CurrentTrans: THTTPRIO;
    spbENElementElement: TSpeedButton;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    sgENSubst150Disconnector: TAdvStringGrid;
    HTTPRIOENSubst150Disconnector: THTTPRIO;
    ToolBar4: TToolBar;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    HTTPRIOENSubst150Discharger: THTTPRIO;
    sgENSubst150Discharger: TAdvStringGrid;
    tsSubst150ShortCircuiter: TTabSheet;
    tsSubst150Separator: TTabSheet;
    ToolBar5: TToolBar;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    ToolBar6: TToolBar;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton42: TToolButton;
    sgENSubst150ShortCircuiter: TAdvStringGrid;
    HTTPRIOENSubst150ShortCircuiter: THTTPRIO;
    HTTPRIOENSubst150Separator: THTTPRIO;
    sgENSubst150Separator: TAdvStringGrid;
    tsSubst150TN: TTabSheet;
    HTTPRIOENSubst150Tn: THTTPRIO;
    ToolBar7: TToolBar;
    ToolButton43: TToolButton;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    sgENSubst150Tn: TAdvStringGrid;
    tsSubst150RZA: TTabSheet;
    HTTPRIOENSubst150RZA: THTTPRIO;
    ToolBar8: TToolBar;
    ToolButton50: TToolButton;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ToolButton53: TToolButton;
    ToolButton54: TToolButton;
    ToolButton55: TToolButton;
    ToolButton56: TToolButton;
    sgENSubst150RZA: TAdvStringGrid;
    tsSubst150TVP: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton57: TToolButton;
    ToolButton58: TToolButton;
    ToolButton59: TToolButton;
    ToolButton60: TToolButton;
    ToolButton61: TToolButton;
    ToolButton62: TToolButton;
    ToolButton63: TToolButton;
    sgENSubst150TVP: TAdvStringGrid;
    HTTPRIOENSubst150TVP: THTTPRIO;
    tsSubst150DGK: TTabSheet;
    ToolBar10: TToolBar;
    ToolButton64: TToolButton;
    ToolButton65: TToolButton;
    ToolButton66: TToolButton;
    ToolButton67: TToolButton;
    ToolButton68: TToolButton;
    ToolButton69: TToolButton;
    ToolButton70: TToolButton;
    sgENSubst150DGK: TAdvStringGrid;
    HTTPRIOENSubst150DGK: THTTPRIO;
    tsSubst150PullOutElement: TTabSheet;
    ToolBar11: TToolBar;
    ToolButton71: TToolButton;
    ToolButton72: TToolButton;
    ToolButton73: TToolButton;
    ToolButton74: TToolButton;
    ToolButton75: TToolButton;
    ToolButton76: TToolButton;
    ToolButton77: TToolButton;
    sgENSubst150PullOutElement: TAdvStringGrid;
    HTTPRIOENSubst150PullOutElement: THTTPRIO;
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
    tsSubst150ControlCable: TTabSheet;
    ToolBar13: TToolBar;
    ToolButton85: TToolButton;
    ToolButton86: TToolButton;
    ToolButton87: TToolButton;
    ToolButton88: TToolButton;
    ToolButton89: TToolButton;
    ToolButton90: TToolButton;
    ToolButton91: TToolButton;
    sgENSubst150ControlCable: TAdvStringGrid;
    HTTPRIOENSubst150ControlCable: THTTPRIO;
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

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbENElementElementClick(Sender : TObject);
    procedure pcENSubst150CellChange(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbVoltageClassClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure sgENInspectionSheetClick(Sender: TObject);
    procedure sgENInspectionSheetDblClick(Sender: TObject);
    procedure actViewInspectionSheetExecute(Sender: TObject);
    procedure actUpdateENInspectionSheetExecute(Sender: TObject);
    procedure actInsertENInspectionSheetExecute(Sender: TObject);
    procedure actDeleteENInspectionSheetExecute(Sender: TObject);
    procedure actEditENInspectionSheetExecute(Sender: TObject);
    procedure actSendToSigningExecute(Sender: TObject);
    procedure actUnSigningExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure actCopySheetExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSubst150CellEdit: TfrmENSubst150CellEdit;
  ENSubst150CellObj: ENSubst150Cell;


  {ColCount, }LastCount: Integer;
  LastRow: Integer = 1;
{
  ENSubst150SwitchHeaders: array [1..7] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Ток отключения, кА'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );

  ENSubst150CurrentTransHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );          

  ENSubst150DisconnectorHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );

  ENSubst150DischargerHeaders: array [1..5] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );

  ENSubst150ShortCircuiterHeaders: array [1..5] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );

  ENSubst150SeparatorHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальный ток, А'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
}

  ENSubst150SwitchHeaders: array [1..7] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Ток отключения, кА'
          ,'Примечание'
        );

  ENSubst150CurrentTransHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

  ENSubst150DisconnectorHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

  ENSubst150DischargerHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Класс напряжения'
          ,'Примечание'
        );

  ENSubst150ShortCircuiterHeaders: array [1..5] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Примечание'
        );

  ENSubst150SeparatorHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

   ENSubst150TnHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

   ENSubst150RZAHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

     ENSubst150TVPHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

      ENSubst150DGKHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

      ENSubst150PullOutElementHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

        ENSubst150TireSectionsHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );

       ENSubst150ControlCableHeaders: array [1..6] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Тип'
          ,'Номинальный ток, А'
          ,'Примечание'
        );
  ENInspectionSheetHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва'
          ,'Вид огляду'
          ,'Статус'
          ,'Дата складання'
          ,'користувач який змінив запис'
          ,'Дата ост. зміни'
        );


implementation

uses
  ShowENElement, ENElementController, ENSubst150SwitchController,
  EditENSubst150Switch, ShowTKMaterials, TKMaterialsController, ShowENVoltageClass,
  ENVoltageClassController, EditENSubst150CurrentTrans, ENSubst150CurrentTransController,
  ENSubst150DisconnectorController, EditENSubst150Disconnector,
  ENSubst150DischargerController, EditENSubst150Discharger, ENSubstation150Controller
, ENConsts, EditENSubst150ShortCircuiter, EditENSubst150Separator,
  ENSubst150ShortCircuiterController, ENSubst150SeparatorController,
  ENSubst150TnController, EditENSubst150Tn, ENSubst150RZAController,
  EditENSubst150RZA, ENSubst150TVPController, EditENSubst150TVP,
  ENSubst150DGKController, EditENSubst150DGK,
  ENSubst150PullOutElementController, EditENSubst150PullOutElement,
  ENSubst150TireSectionController, EditENSubst150TireSection,
  ENSubst150ControlCableController, EditENSubst150ControlCable
  , ENInspectionSheetController
  , EditENInspectionSheet
  , AddENInspectionSheet
;


{$R *.dfm}



procedure TfrmENSubst150CellEdit.FormShow(Sender: TObject);
var
  TempENVoltageClass : ENVoltageClassControllerSoapPort;
  voltageClass : ENVoltageClass;
  TempTKMaterials : TKMaterialsControllerSoapPort;
  material : TKMaterials;
  i: Integer;
begin

  pcENSubst150Cell.ActivePage := tsENSubst150;
  SetGridHeaders(ENSubst150SwitchHeaders, sgENSubst150Switch.ColumnHeaders);
  SetGridHeaders(ENSubst150CurrentTransHeaders, sgENSubst150CurrentTrans.ColumnHeaders);
  SetGridHeaders(ENSubst150DisconnectorHeaders, sgENSubst150Disconnector.ColumnHeaders);
  SetGridHeaders(ENSubst150DischargerHeaders, sgENSubst150Discharger.ColumnHeaders);
  SetGridHeaders(ENSubst150ShortCircuiterHeaders, sgENSubst150ShortCircuiter.ColumnHeaders);
  SetGridHeaders(ENSubst150SeparatorHeaders, sgENSubst150Separator.ColumnHeaders);
  SetGridHeaders(ENSubst150TNHeaders, sgENSubst150TN.ColumnHeaders);
  SetGridHeaders(ENSubst150RZAHeaders, sgENSubst150RZA.ColumnHeaders);
  SetGridHeaders(ENSubst150TVPHeaders, sgENSubst150TVP.ColumnHeaders);
  SetGridHeaders(ENSubst150DGKHeaders, sgENSubst150DGK.ColumnHeaders);
  SetGridHeaders(ENSubst150PullOutElementHeaders, sgENSubst150PullOutElement.ColumnHeaders);
  SetGridHeaders(ENSubst150TireSectionsHeaders, sgENSubst150TireSection.ColumnHeaders);
  SetGridHeaders(ENSubst150ControlCableHeaders, sgENSubst150ControlCable.ColumnHeaders);

  SetGridHeaders(ENInspectionSheetHeaders, sgENInspectionSheet.ColumnHeaders);
  ClearGrid(sgENInspectionSheet);


  DisableControls([edtCode, edtVoltageClass, edtMaterialsName]);

  tsSubst150Switch.TabVisible := (DialogState <> dsInsert);
  tsSubst150CurrentTrans.TabVisible := (DialogState <> dsInsert);
  tsSubst150Disconnector.TabVisible := (DialogState <> dsInsert);
  /// Разрядники показываем только для ячеек 6-10 кВ
  // tsSubst150Discharger.TabVisible := (DialogState <> dsInsert);
  tsSubst150Discharger.TabVisible := false;
  tsSubst150ShortCircuiter.TabVisible := false;
  tsSubst150Separator.TabVisible := false;

  ///// При инсерте прячем все вкладки, кроме основной
  if (DialogState = dsInsert) then
  begin
    for i:= 0 to pcENSubst150Cell.PageCount - 1 do
      if pcENSubst150Cell.Pages[i] <> tsENSubst150 then
        pcENSubst150Cell.Pages[i].TabVisible := false;
  end;
  /////

  if DialogState = dsView then
  begin
    DisableControls([edtCode, spbTkMaterials, spbVoltageClass]);
    DisableActions([actInsert, actEdit, actDelete]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtVoltageClass{, edtFactoryNumber}]);
  end;

  if ENSubst150CellObj.voltageClassRef <> nil then
  begin
    if (ENSubst150CellObj.voltageClassRef.code <> Low(Integer)) then
    begin
      TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
      voltageClass := TempENVoltageClass.getObject(ENSubst150CellObj.voltageClassRef.code);
      edtVoltageClass.Text := voltageClass.description; //voltageClass.value.DecimalString;

      // SUPP-98666... 05.03.2021... показываем для всех...
      /// Разрядники показываем только для ячеек 6-10 кВ
      // if (voltageClass.code = ENVOLTAGECLASS_10) or (voltageClass.code = ENVOLTAGECLASS_6) then
      tsSubst150Discharger.TabVisible := (DialogState <> dsInsert);

      /// Короткозамыкатели и отделители показываем только для ячеек 6-10 кВ
      if (voltageClass.code = ENVOLTAGECLASS_150) or (voltageClass.code = ENVOLTAGECLASS_35) then
      begin
        tsSubst150ShortCircuiter.TabVisible := (DialogState <> dsInsert);
        tsSubst150Separator.TabVisible := (DialogState <> dsInsert);
      end;

      DisableControls([spbVoltageClass], (DialogState = dsView)
        or not CheckValueInArray(ENSubst150CellObj.voltageClassRef.code,
          [ENVOLTAGECLASS_10, ENVOLTAGECLASS_6]));
    end;
  end
  else begin
    // Сюда зайдет только, если 6 или 10 кВ
    /// Разрядники показываем только для ячеек 6-10 кВ
    tsSubst150Discharger.TabVisible := (DialogState <> dsInsert);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtCode.Text := IntToStr(ENSubst150CellObj.code);
    edtName.Text := ENSubst150CellObj.name;
    edtFactoryNumber.Text := ENSubst150CellObj.factoryNumber;
    MakeMultiline(edtCommentGen.Lines, ENSubst150CellObj.commentGen);

    { // При инсерте тоже будем выводить, потому что класс напр. будет сетиться из вызывающей формы (формы подстанции)
    if (ENSubst150CellObj.voltageClassRef.code <> Low(Integer)) then
    begin
      TempENVoltageClass :=  HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;
      voltageClass := TempENVoltageClass.getObject(ENSubst150CellObj.voltageClassRef.code);
      edtVoltageClass.Text := voltageClass.value.DecimalString;
    end;
    }

    if (ENSubst150CellObj.materialRef.code <> Low(Integer)) then
    begin
      TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      material := TempTKMaterials.getObject(ENSubst150CellObj.materialRef.code);
      edtMaterialsName.Text := material.name;
    end;

  end;
end;


procedure TfrmENSubst150CellEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubst150Cell: ENSubst150CellControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtVoltageClass{, edtFactoryNumber}])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;

    ENSubst150CellObj.name := edtName.Text;
    ENSubst150CellObj.factoryNumber := edtFactoryNumber.Text;
    ENSubst150CellObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENSubst150CellObj.code:=low(Integer);
      TempENSubst150Cell.add(ENSubst150CellObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubst150Cell.save(ENSubst150CellObj);
    end;
  end;
end;


procedure TfrmENSubst150CellEdit.sgENInspectionSheetClick(Sender: TObject);
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

  actEditENInspectionSheet.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actDeleteENInspectionSheet.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
end;


procedure TfrmENSubst150CellEdit.sgENInspectionSheetDblClick(Sender: TObject);
begin
  inherited;
  actViewInspectionSheetExecute(Sender);
end;


procedure TfrmENSubst150CellEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubst150CellObj.element = nil then ENSubst150CellObj.element := ENElement.Create();
               ENSubst150CellObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENSubst150CellEdit.pcENSubst150CellChange(Sender: TObject);
var
  i : Integer;
  TempENSubst150Switch : ENSubst150SwitchControllerSoapPort;
  ENSubst150SwitchList : ENSubst150SwitchShortList;
  Subst150SwitchFilterObject : ENSubst150SwitchFilter;

  TempENSubst150CurrentTrans : ENSubst150CurrentTransControllerSoapPort;
  transList : ENSubst150CurrentTransShortList;
  transFilterObject : ENSubst150CurrentTransFilter;

  TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
  disconnectorList : ENSubst150DisconnectorShortList;
  disconnectorFilter : ENSubst150DisconnectorFilter;

  TempENSubst150Discharger : ENSubst150DischargerControllerSoapPort;
  dischargerList : ENSubst150DischargerShortList;
  dischargerFilter : ENSubst150DischargerFilter;

  TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
  shortCircuiterList: ENSubst150ShortCircuiterShortList;
  shortCircuiterFilter: ENSubst150ShortCircuiterFilter;

  TempENSubst150Separator: ENSubst150SeparatorControllerSoapPort;
  separatorList: ENSubst150SeparatorShortList;
  separatorFilter: ENSubst150SeparatorFilter;

  TempENSubst150Tn: ENSubst150TnControllerSoapPort;
  TNList: ENSubst150TNShortList;
  TNFilter: ENSubst150TNFilter;

  TempENSubst150RZA: ENSubst150RZAControllerSoapPort;
  RZAList: ENSubst150RZAShortList;
  RZAFilter: ENSubst150RZAFilter;

  TempENSubst150TVP: ENSubst150TVPControllerSoapPort;
  TVPList: ENSubst150TVPShortList;
  TVPFilter: ENSubst150TVPFilter;

  TempENSubst150DGK: ENSubst150DGKControllerSoapPort;
  DGKList: ENSubst150DGKShortList;
  DGKFilter: ENSubst150DGKFilter;

  TempENSubst150PullOutElement: ENSubst150PullOutElementControllerSoapPort;
  PullOutElementList: ENSubst150PullOutElementShortList;
  PullOutElementFilter: ENSubst150PullOutElementFilter;

  TempENSubst150TireSection: ENSubst150TireSectionControllerSoapPort;
  TireSectionList: ENSubst150TireSectionShortList;
  TireSectionFilter: ENSubst150TireSectionFilter;

  TempENSubst150ControlCable: ENSubst150ControlCableControllerSoapPort;
  ControlCableList: ENSubst150ControlCableShortList;
  ControlCableFilter: ENSubst150ControlCableFilter;

  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  inspectionSheetFilter: ENInspectionSheetFilter;
  ENInspectionSheetList: ENInspectionSheetShortList;
begin

  // ENInspectionSheet
  if pcENSubst150Cell.ActivePage = tsENInspectionSheet then
  begin
    SetGridHeaders(ENInspectionSheetHeaders, sgENInspectionSheet.ColumnHeaders);
    ClearGrid(sgENInspectionSheet);
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

    inspectionSheetFilter := ENInspectionSheetFilter.Create;
    SetNullIntProps(inspectionSheetFilter);
    SetNullXSProps(inspectionSheetFilter);

    inspectionSheetFilter.elementRef := ENElementRef.Create;
    inspectionSheetFilter.elementRef.code := ENSubst150CellObj.element.code;

    ENInspectionSheetList := TempENInspectionSheet.getScrollableFilteredList(inspectionSheetFilter, 0, -1);
    LastCount:=High(ENInspectionSheetList.list);

    if LastCount > -1 then
       sgENInspectionSheet.RowCount:=LastCount+2
    else
       sgENInspectionSheet.RowCount:=2;

    with sgENInspectionSheet do
    for i:=0 to LastCount do
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

    sgENInspectionSheet.Row:=1;

    sgENInspectionSheetClick(sgENInspectionSheet);
  end;


  // start  tsSubst150Switch   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Switch) then
  begin
    ClearGrid(sgENSubst150Switch);

    TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;

    Subst150SwitchFilterObject := ENSubst150SwitchFilter.Create;
    SetNullIntProps(Subst150SwitchFilterObject);
    SetNullXSProps(Subst150SwitchFilterObject);

    Subst150SwitchFilterObject.cellRef := ENSubst150CellRef.Create;
    Subst150SwitchFilterObject.cellRef.code := ENSubst150CellObj.code;

    ENSubst150SwitchList := TempENSubst150Switch.getScrollableFilteredList(ENSubst150SwitchFilter(Subst150SwitchFilterObject),0,-1);

    LastCount:=High(ENSubst150SwitchList.list);

    if LastCount > -1 then
       sgENSubst150Switch.RowCount:=LastCount+2
    else
       sgENSubst150Switch.RowCount:=2;

     with sgENSubst150Switch do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENSubst150SwitchList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENSubst150SwitchList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENSubst150SwitchList.list[i].name;
          Cells[2,i+1] := ENSubst150SwitchList.list[i].factoryNumber;

          Cells[3,i+1] := ENSubst150SwitchList.list[i].typeRefName;

          if ENSubst150SwitchList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := ENSubst150SwitchList.list[i].currentNominal.DecimalString;
          if ENSubst150SwitchList.list[i].currentDisconnection = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := ENSubst150SwitchList.list[i].currentDisconnection.DecimalString;

          Cells[6,i+1] := ENSubst150SwitchList.list[i].commentGen;
          //Cells[6,i+1] := ENSubst150SwitchList.list[i].userGen;

          LastRow:=i+1;
          sgENSubst150Switch.RowCount:=LastRow+1;
        end;
        
     sgENSubst150Switch.Row:=1;
  end;
  // end  tsSubst150Switch   ---------------

  // start  tsSubst150CurrentTrans   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150CurrentTrans) then
  begin
    ClearGrid(sgENSubst150CurrentTrans);

    TempENSubst150CurrentTrans :=  HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;

    transFilterObject := ENSubst150CurrentTransFilter.Create;
    SetNullIntProps(transFilterObject);
    SetNullXSProps(transFilterObject);

    transFilterObject.cellRef := ENSubst150CellRef.Create;
    transFilterObject.cellRef.code := ENSubst150CellObj.code;

    transList := TempENSubst150CurrentTrans.getScrollableFilteredList(ENSubst150CurrentTransFilter(transFilterObject),0,-1);

    LastCount:=High(transList.list);

    if LastCount > -1 then
       sgENSubst150CurrentTrans.RowCount:=LastCount+2
    else
       sgENSubst150CurrentTrans.RowCount:=2;

     with sgENSubst150CurrentTrans do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if transList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(transList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := transList.list[i].name;
          Cells[2,i+1] := transList.list[i].factoryNumber;

          Cells[3,i+1] := transList.list[i].typeRefName;

          if transList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := transList.list[i].currentNominal.DecimalString;

          Cells[5,i+1] := transList.list[i].commentGen;
          //Cells[5,i+1] := transList.list[i].userGen;

          LastRow:=i+1;
          sgENSubst150CurrentTrans.RowCount:=LastRow+1;
        end;

     sgENSubst150CurrentTrans.Row:=1;
  end;
  // end  tsSubst150CurrentTrans   ---------------

  // start  tsSubst150Disconnector   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Disconnector) then
  begin
    ClearGrid(sgENSubst150Disconnector);

    TempENSubst150Disconnector := HTTPRIOENSubst150Disconnector as ENSubst150DisconnectorControllerSoapPort;

    disconnectorFilter := ENSubst150DisconnectorFilter.Create;
    SetNullIntProps(disconnectorFilter);
    SetNullXSProps(disconnectorFilter);

    disconnectorFilter.cellRef := ENSubst150CellRef.Create;
    disconnectorFilter.cellRef.code := ENSubst150CellObj.code;

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

  // start  tsSubst150Discharger   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Discharger) then
  begin
    ClearGrid(sgENSubst150Discharger);

    TempENSubst150Discharger :=  HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;

    dischargerFilter := ENSubst150DischargerFilter.Create;
    SetNullIntProps(dischargerFilter);
    SetNullXSProps(dischargerFilter);
    dischargerFilter.cellRef := ENSubst150CellRef.Create;
    dischargerFilter.cellRef.code := ENSubst150CellObj.code;
    dischargerFilter.substationRef := ENSubstation150Ref.Create;
    dischargerFilter.substationRef.code := ENSubst150CellObj.substationRef.code;

    dischargerList := TempENSubst150Discharger.getScrollableFilteredList(ENSubst150DischargerFilter(dischargerFilter),0,-1);
    LastCount:=High(dischargerList.list);

    if LastCount > -1 then
       sgENSubst150Discharger.RowCount:=LastCount+2
    else
       sgENSubst150Discharger.RowCount:=2;

     with sgENSubst150Discharger do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if dischargerList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(dischargerList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := dischargerList.list[i].name;
          Cells[2,i+1] := dischargerList.list[i].factoryNumber;
          //Cells[3,i+1] := dischargerList.list[i].commentGen;
          //Cells[4,i+1] := dischargerList.list[i].userGen;
          Cells[3,i+1] := dischargerList.list[i].typeRefName;
          Cells[4,i+1] := dischargerList.list[i].voltageClassRefDescription;

          Cells[5,i+1] := dischargerList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150Discharger.RowCount:=LastRow+1;
        end;

     sgENSubst150Discharger.Row:=1;
  end;
  // end  tsSubst150Discharger   ---------------

  // start  tsSubst150ShortCircuiter   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ShortCircuiter) then
  begin
    ClearGrid(sgENSubst150ShortCircuiter);

    TempENSubst150ShortCircuiter :=  HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;

    shortCircuiterFilter := ENSubst150ShortCircuiterFilter.Create;
    SetNullIntProps(shortCircuiterFilter);
    SetNullXSProps(shortCircuiterFilter);
    shortCircuiterFilter.cellRef := ENSubst150CellRef.Create;
    shortCircuiterFilter.cellRef.code := ENSubst150CellObj.code;

    shortCircuiterList := TempENSubst150ShortCircuiter.getScrollableFilteredList(shortCircuiterFilter,0,-1);
    LastCount:=High(shortCircuiterList.list);

    if LastCount > -1 then
       sgENSubst150ShortCircuiter.RowCount:=LastCount+2
    else
       sgENSubst150ShortCircuiter.RowCount:=2;

     with sgENSubst150ShortCircuiter do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if shortCircuiterList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(shortCircuiterList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := shortCircuiterList.list[i].name;
          Cells[2,i+1] := shortCircuiterList.list[i].factoryNumber;
          Cells[3,i+1] := shortCircuiterList.list[i].typeRefName;
          Cells[4,i+1] := shortCircuiterList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150ShortCircuiter.RowCount:=LastRow+1;
        end;

     sgENSubst150ShortCircuiter.Row:=1;
  end;
  // end  tsSubst150ShortCircuiter   ---------------

  // start  tsSubst150Separator   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Separator) then
  begin
    ClearGrid(sgENSubst150Separator);

    TempENSubst150Separator :=  HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;

    separatorFilter := ENSubst150SeparatorFilter.Create;
    SetNullIntProps(separatorFilter);
    SetNullXSProps(separatorFilter);
    separatorFilter.cellRef := ENSubst150CellRef.Create;
    separatorFilter.cellRef.code := ENSubst150CellObj.code;

    separatorList := TempENSubst150Separator.getScrollableFilteredList(separatorFilter,0,-1);
    LastCount:=High(separatorList.list);

    if LastCount > -1 then
       sgENSubst150Separator.RowCount:=LastCount+2
    else
       sgENSubst150Separator.RowCount:=2;

     with sgENSubst150Separator do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if separatorList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(separatorList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := separatorList.list[i].name;
          Cells[2,i+1] := separatorList.list[i].factoryNumber;
          Cells[3,i+1] := separatorList.list[i].typeRefName;
          if separatorList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := separatorList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := separatorList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150Separator.RowCount:=LastRow+1;
        end;

     sgENSubst150Separator.Row:=1;
  end;
  // end  tsSubst150Separator   ---------------

  // start  tsSubst150TN   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TN) then
  begin
    ClearGrid(sgENSubst150TN);

    TempENSubst150TN :=  HTTPRIOENSubst150TN as ENSubst150TNControllerSoapPort;

    TNFilter := ENSubst150TNFilter.Create;
    SetNullIntProps(TNFilter);
    SetNullXSProps(TNFilter);
    TNFilter.cellRef := ENSubst150CellRef.Create;
    TNFilter.cellRef.code := ENSubst150CellObj.code;

    TNList := TempENSubst150TN.getScrollableFilteredList(TNFilter,0,-1);
    LastCount:=High(TNList.list);

    if LastCount > -1 then
       sgENSubst150TN.RowCount:=LastCount+2
    else
       sgENSubst150TN.RowCount:=2;

     with sgENSubst150TN do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if TNList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TNList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := TNList.list[i].name;
          Cells[2,i+1] := TNList.list[i].factoryNumber;
          Cells[3,i+1] := TNList.list[i].typeRefName;
          if TNList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := TNList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := TNList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150TN.RowCount:=LastRow+1;
        end;

     sgENSubst150TN.Row:=1;
  end;
  // end  tsSubst150TN   ---------------

  // start  tsSubst150RZA   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150RZA) then
  begin
    ClearGrid(sgENSubst150RZA);

    TempENSubst150RZA :=  HTTPRIOENSubst150RZA as ENSubst150RZAControllerSoapPort;

    RZAFilter := ENSubst150RZAFilter.Create;
    SetNullIntProps(RZAFilter);
    SetNullXSProps(RZAFilter);
    RZAFilter.cellRef := ENSubst150CellRef.Create;
    RZAFilter.cellRef.code := ENSubst150CellObj.code;

    RZAList := TempENSubst150RZA.getScrollableFilteredList(RZAFilter,0,-1);
    LastCount:=High(RZAList.list);

    if LastCount > -1 then
       sgENSubst150RZA.RowCount:=LastCount+2
    else
       sgENSubst150RZA.RowCount:=2;

     with sgENSubst150RZA do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if RZAList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RZAList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := RZAList.list[i].name;
          Cells[2,i+1] := RZAList.list[i].factoryNumber;
          Cells[3,i+1] := RZAList.list[i].typeRefName;
          if RZAList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := RZAList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := RZAList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150RZA.RowCount:=LastRow+1;
        end;

     sgENSubst150RZA.Row:=1;
  end;
  // end  tsSubst150RZA   ---------------

  // start  tsSubst150TVP   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TVP) then
  begin
    ClearGrid(sgENSubst150TVP);

    TempENSubst150TVP :=  HTTPRIOENSubst150TVP as ENSubst150TVPControllerSoapPort;

    TVPFilter := ENSubst150TVPFilter.Create;
    SetNullIntProps(TVPFilter);
    SetNullXSProps(TVPFilter);
    TVPFilter.cellRef := ENSubst150CellRef.Create;
    TVPFilter.cellRef.code := ENSubst150CellObj.code;

    TVPList := TempENSubst150TVP.getScrollableFilteredList(TVPFilter,0,-1);
    LastCount:=High(TVPList.list);

    if LastCount > -1 then
       sgENSubst150TVP.RowCount:=LastCount+2
    else
       sgENSubst150TVP.RowCount:=2;

     with sgENSubst150TVP do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if TVPList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(TVPList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := TVPList.list[i].name;
          Cells[2,i+1] := TVPList.list[i].factoryNumber;
          Cells[3,i+1] := TVPList.list[i].typeRefName;
          if TVPList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := TVPList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := TVPList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150TVP.RowCount:=LastRow+1;
        end;

     sgENSubst150TVP.Row:=1;
  end;
  // end  tsSubst150TVP   ---------------

  // start  tsSubst150DGK   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150DGK) then
  begin
    ClearGrid(sgENSubst150DGK);

    TempENSubst150DGK :=  HTTPRIOENSubst150DGK as ENSubst150DGKControllerSoapPort;

    DGKFilter := ENSubst150DGKFilter.Create;
    SetNullIntProps(DGKFilter);
    SetNullXSProps(DGKFilter);
    DGKFilter.cellRef := ENSubst150CellRef.Create;
    DGKFilter.cellRef.code := ENSubst150CellObj.code;

    DGKList := TempENSubst150DGK.getScrollableFilteredList(DGKFilter,0,-1);
    LastCount:=High(DGKList.list);

    if LastCount > -1 then
       sgENSubst150DGK.RowCount:=LastCount+2
    else
       sgENSubst150DGK.RowCount:=2;

     with sgENSubst150DGK do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if DGKList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(DGKList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := DGKList.list[i].name;
          Cells[2,i+1] := DGKList.list[i].factoryNumber;
          Cells[3,i+1] := DGKList.list[i].typeRefName;
          if DGKList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := DGKList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := DGKList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150DGK.RowCount:=LastRow+1;
        end;

     sgENSubst150DGK.Row:=1;
  end;
  // end  tsSubst150DGK   ---------------

  // start  tsSubst150PullOutElement   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150PullOutElement) then
  begin
    ClearGrid(sgENSubst150PullOutElement);

    TempENSubst150PullOutElement :=  HTTPRIOENSubst150PullOutElement as ENSubst150PullOutElementControllerSoapPort;

    PullOutElementFilter := ENSubst150PullOutElementFilter.Create;
    SetNullIntProps(PullOutElementFilter);
    SetNullXSProps(PullOutElementFilter);
    PullOutElementFilter.cellRef := ENSubst150CellRef.Create;
    PullOutElementFilter.cellRef.code := ENSubst150CellObj.code;

    PullOutElementList := TempENSubst150PullOutElement.getScrollableFilteredList(PullOutElementFilter,0,-1);
    LastCount:=High(PullOutElementList.list);

    if LastCount > -1 then
       sgENSubst150PullOutElement.RowCount:=LastCount+2
    else
       sgENSubst150PullOutElement.RowCount:=2;

     with sgENSubst150PullOutElement do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if PullOutElementList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(PullOutElementList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := PullOutElementList.list[i].name;
          Cells[2,i+1] := PullOutElementList.list[i].factoryNumber;
          Cells[3,i+1] := PullOutElementList.list[i].typeRefName;
          if PullOutElementList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := PullOutElementList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := PullOutElementList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150PullOutElement.RowCount:=LastRow+1;
        end;

     sgENSubst150PullOutElement.Row:=1;
  end;
  // end  tsSubst150PullOutElement   ---------------

  // start  tsSubst150TireSection   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TireSection) then
  begin
    ClearGrid(sgENSubst150TireSection);

    TempENSubst150TireSection :=  HTTPRIOENSubst150TireSection as ENSubst150TireSectionControllerSoapPort;

    TireSectionFilter := ENSubst150TireSectionFilter.Create;
    SetNullIntProps(TireSectionFilter);
    SetNullXSProps(TireSectionFilter);
    TireSectionFilter.cellRef := ENSubst150CellRef.Create;
    TireSectionFilter.cellRef.code := ENSubst150CellObj.code;

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

  // start  tsSubst150ControlCable   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ControlCable) then
  begin
    ClearGrid(sgENSubst150ControlCable);

    TempENSubst150ControlCable :=  HTTPRIOENSubst150ControlCable as ENSubst150ControlCableControllerSoapPort;

    ControlCableFilter := ENSubst150ControlCableFilter.Create;
    SetNullIntProps(ControlCableFilter);
    SetNullXSProps(ControlCableFilter);
    ControlCableFilter.cellRef := ENSubst150CellRef.Create;
    ControlCableFilter.cellRef.code := ENSubst150CellObj.code;

    ControlCableList := TempENSubst150ControlCable.getScrollableFilteredList(ControlCableFilter,0,-1);
    LastCount:=High(ControlCableList.list);

    if LastCount > -1 then
       sgENSubst150ControlCable.RowCount:=LastCount+2
    else
       sgENSubst150ControlCable.RowCount:=2;

     with sgENSubst150ControlCable do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ControlCableList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ControlCableList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := ControlCableList.list[i].name;
          Cells[2,i+1] := ControlCableList.list[i].factoryNumber;
          Cells[3,i+1] := ControlCableList.list[i].typeRefName;
          if ControlCableList.list[i].currentNominal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := ControlCableList.list[i].currentNominal.DecimalString;
          Cells[5,i+1] := ControlCableList.list[i].commentGen;

          LastRow:=i+1;
          sgENSubst150ControlCable.RowCount:=LastRow+1;
        end;

     sgENSubst150ControlCable.Row:=1;
  end;
  // end  tsSubst150ControlCable   ---------------
end;



procedure TfrmENSubst150CellEdit.actViewExecute(Sender: TObject);
var
  TempENSubst150Switch : ENSubst150SwitchControllerSoapPort;
  TempENSubst150CurrentTrans : ENSubst150CurrentTransControllerSoapPort;
  TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
  TempENSubst150Discharger : ENSubst150DischargerControllerSoapPort;
  TempENSubst150ShortCircuiter : ENSubst150ShortCircuiterControllerSoapPort;
  TempENSubst150Separator : ENSubst150SeparatorControllerSoapPort;
  TempENSubst150TN : ENSubst150TNControllerSoapPort;
  TempENSubst150RZA : ENSubst150RZAControllerSoapPort;
  TempENSubst150TVP : ENSubst150TVPControllerSoapPort;
  TempENSubst150DGK : ENSubst150DGKControllerSoapPort;
  TempENSubst150PullOutElement : ENSubst150PullOutElementControllerSoapPort;
  TempENSubst150TireSection : ENSubst150TireSectionControllerSoapPort;
  TempENSubst150ControlCable : ENSubst150ControlCableControllerSoapPort;
begin

  // start  tsSubst150Switch   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Switch) then
  begin
    TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
    try
      ENSubst150SwitchObj := TempENSubst150Switch.getObject(StrToInt(sgENSubst150Switch.Cells[0,sgENSubst150Switch.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150SwitchEdit := TfrmENSubst150SwitchEdit.Create(Application, dsView);
    try
      frmENSubst150SwitchEdit.ShowModal;
    finally
      frmENSubst150SwitchEdit.Free;
      frmENSubst150SwitchEdit:=nil;
    end;
  end;
  // end  tsSubst150Switch   ---------------    

  // start  tsSubst150CurrentTrans   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150CurrentTrans) then
  begin
    TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
    try
      ENSubst150CurrentTransObj := TempENSubst150CurrentTrans.getObject(StrToInt(sgENSubst150CurrentTrans.Cells[0,sgENSubst150CurrentTrans.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150CurrentTransEdit := TfrmENSubst150CurrentTransEdit.Create(Application, dsView);
    try
      frmENSubst150CurrentTransEdit.ShowModal;
    finally
      frmENSubst150CurrentTransEdit.Free;
      frmENSubst150CurrentTransEdit:=nil;
    end;
  end;
  // end  tsSubst150CurrentTrans   ---------------

  // start  tsSubst150Disconnector   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Disconnector) then
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

  // start  tsSubst150Discharger   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Discharger) then
  begin
    TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
    try
      ENSubst150DischargerObj := TempENSubst150Discharger.getObject(StrToInt(sgENSubst150Discharger.Cells[0,sgENSubst150Discharger.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150DischargerEdit := TfrmENSubst150DischargerEdit.Create(Application, dsView);
    try
      frmENSubst150DischargerEdit.ShowModal;
    finally
      frmENSubst150DischargerEdit.Free;
      frmENSubst150DischargerEdit:=nil;
    end;

  end;
  // end  tsSubst150Discharger   ---------------

  // start  tsSubst150ShortCircuiter   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ShortCircuiter) then
  begin
    TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
    try
      ENSubst150ShortCircuiterObj := TempENSubst150ShortCircuiter.getObject(StrToInt(sgENSubst150ShortCircuiter.Cells[0,sgENSubst150ShortCircuiter.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150ShortCircuiterEdit := TfrmENSubst150ShortCircuiterEdit.Create(Application, dsView);
    try
      frmENSubst150ShortCircuiterEdit.ShowModal;
    finally
      frmENSubst150ShortCircuiterEdit.Free;
      frmENSubst150ShortCircuiterEdit:=nil;
    end;

  end;
  // end  tsSubst150ShortCircuiter   ---------------

 // start  tsSubst150Separator   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Separator) then
  begin
    TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
    try
      ENSubst150SeparatorObj := TempENSubst150Separator.getObject(StrToInt(sgENSubst150Separator.Cells[0,sgENSubst150Separator.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150SeparatorEdit := TfrmENSubst150SeparatorEdit.Create(Application, dsView);
    try
      frmENSubst150SeparatorEdit.ShowModal;
    finally
      frmENSubst150SeparatorEdit.Free;
      frmENSubst150SeparatorEdit:=nil;
    end;

  end;
  // end  tsSubst150Separator   ---------------

  // start  tsSubst150TN   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TN) then
  begin
    TempENSubst150TN := HTTPRIOENSubst150TN as ENSubst150TNControllerSoapPort;
    try
      ENSubst150TNObj := TempENSubst150TN.getObject(StrToInt(sgENSubst150TN.Cells[0,sgENSubst150TN.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150TNEdit := TfrmENSubst150TNEdit.Create(Application, dsView);
    try
      frmENSubst150TNEdit.ShowModal;
    finally
      frmENSubst150TNEdit.Free;
      frmENSubst150TNEdit:=nil;
    end;

  end;
  // end  tsSubst150TN   ---------------


 // start  tsSubst150RZA   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150RZA) then
  begin
    TempENSubst150RZA := HTTPRIOENSubst150RZA as ENSubst150RZAControllerSoapPort;
    try
      ENSubst150RZAObj := TempENSubst150RZA.getObject(StrToInt(sgENSubst150RZA.Cells[0,sgENSubst150RZA.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150RZAEdit := TfrmENSubst150RZAEdit.Create(Application, dsView);
    try
      frmENSubst150RZAEdit.ShowModal;
    finally
      frmENSubst150RZAEdit.Free;
      frmENSubst150RZAEdit:=nil;
    end;

  end;
  // end  tsSubst150RZA   ---------------

  // start  tsSubst150TVP   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TVP) then
  begin
    TempENSubst150TVP := HTTPRIOENSubst150TVP as ENSubst150TVPControllerSoapPort;
    try
      ENSubst150TVPObj := TempENSubst150TVP.getObject(StrToInt(sgENSubst150TVP.Cells[0,sgENSubst150TVP.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150TVPEdit := TfrmENSubst150TVPEdit.Create(Application, dsView);
    try
      frmENSubst150TVPEdit.ShowModal;
    finally
      frmENSubst150TVPEdit.Free;
      frmENSubst150TVPEdit:=nil;
    end;

  end;
  // end  tsSubst150TVP   ---------------

  // start  tsSubst150DGK   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150DGK) then
  begin
    TempENSubst150DGK := HTTPRIOENSubst150DGK as ENSubst150DGKControllerSoapPort;
    try
      ENSubst150DGKObj := TempENSubst150DGK.getObject(StrToInt(sgENSubst150DGK.Cells[0,sgENSubst150DGK.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150DGKEdit := TfrmENSubst150DGKEdit.Create(Application, dsView);
    try
      frmENSubst150DGKEdit.ShowModal;
    finally
      frmENSubst150DGKEdit.Free;
      frmENSubst150DGKEdit:=nil;
    end;

  end;
  // end  tsSubst150DGK   ---------------

  // start  tsSubst150PullOutElement   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150PullOutElement) then
  begin
    TempENSubst150PullOutElement := HTTPRIOENSubst150PullOutElement as ENSubst150PullOutElementControllerSoapPort;
    try
      ENSubst150PullOutElementObj := TempENSubst150PullOutElement.getObject(StrToInt(sgENSubst150PullOutElement.Cells[0,sgENSubst150PullOutElement.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150PullOutElementEdit := TfrmENSubst150PullOutElementEdit.Create(Application, dsView);
    try
      frmENSubst150PullOutElementEdit.ShowModal;
    finally
      frmENSubst150PullOutElementEdit.Free;
      frmENSubst150PullOutElementEdit:=nil;
    end;

  end;
  // end  tsSubst150PullOutElement   ---------------

  // start  tsSubst150TireSection   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TireSection) then
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


  // start  tsSubst150ControlCable   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ControlCable) then
  begin
    TempENSubst150ControlCable := HTTPRIOENSubst150ControlCable as ENSubst150ControlCableControllerSoapPort;
    try
      ENSubst150ControlCableObj := TempENSubst150ControlCable.getObject(StrToInt(sgENSubst150ControlCable.Cells[0,sgENSubst150ControlCable.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150ControlCableEdit := TfrmENSubst150ControlCableEdit.Create(Application, dsView);
    try
      frmENSubst150ControlCableEdit.ShowModal;
    finally
      frmENSubst150ControlCableEdit.Free;
      frmENSubst150ControlCableEdit:=nil;
    end;

  end;
  // end  tsSubst150ControlCable   ---------------
end;


procedure TfrmENSubst150CellEdit.actViewInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsView);

    try
      frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
    except
      on EConvertError do Exit;
    end;

    try
      if frmENInspectionSheetEdit.ShowModal = mrOk then
      begin
        pcENSubst150CellChange(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
end;


procedure TfrmENSubst150CellEdit.spbTkMaterialsClick(Sender: TObject);
var
  frmSpr_matherialShow : TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //Исключено объявление не используемых переменных
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      if ShowModal = mrOk then
      begin
        try
          if ENSubst150CellObj.materialRef = nil then
            ENSubst150CellObj.materialRef := TKMaterialsRef.Create;
          ENSubst150CellObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialsName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;


procedure TfrmENSubst150CellEdit.spbVoltageClassClick(Sender: TObject);
var
  frmENVoltageClassShow : TfrmENVoltageClassShow;
  f: ENVoltageClassFilter;
begin
  // Только для ячеек 6-10 кВ даем выбирать одно из двух значений (6 или 10)
  // (для 150 и 35 будет засечено автоматом при вызове из формы Подстанции)
  f := ENVoltageClassFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := 'code in (' + IntToStr(ENVOLTAGECLASS_10) + ', ' + IntToStr(ENVOLTAGECLASS_6) + ')';

  frmENVoltageClassShow := TfrmENVoltageClassShow.Create(Application, fmNormal, f);
  try
    frmENVoltageClassShow.DisableActions([frmENVoltageClassShow.actInsert,
                                          frmENVoltageClassShow.actEdit,
                                          frmENVoltageClassShow.actDelete,
                                          frmENVoltageClassShow.actFilter,
                                          frmENVoltageClassShow.actNoFilter]);
    with frmENVoltageClassShow do
      if ShowModal = mrOk then
        begin
            try
              if ENSubst150CellObj.voltageClassRef = nil then
                ENSubst150CellObj.voltageClassRef := ENVoltageClassRef.Create;
              ENSubst150CellObj.voltageClassRef.code := StrToInt(GetReturnValue(sgENVoltageClass,0));
              edtVoltageClass.Text := GetReturnValue(sgENVoltageClass,2);
            except
              on EConvertError do Exit;
            end;
        end;
  finally
    frmENVoltageClassShow.Free;
  end;
end;


procedure TfrmENSubst150CellEdit.actInsertENInspectionSheetExecute(Sender: TObject);
begin
  inherited;
  frmENInspectionSheetAdd := TfrmENInspectionSheetAdd.Create(Application, dsInsert);
  frmENInspectionSheetAdd.elementType := ENSubst150CellObj.element.typeRef.code;

  frmENInspectionSheetAdd.ENInspectionSheetObj := ENInspectionSheet.Create;
  SetNullIntProps(frmENInspectionSheetAdd.ENInspectionSheetObj);
  SetNullXSProps(frmENInspectionSheetAdd.ENInspectionSheetObj);

  frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef := ENElementRef.Create;
  frmENInspectionSheetAdd.ENInspectionSheetObj.elementRef.code := ENSubst150CellObj.element.code;
  frmENInspectionSheetAdd.ENInspectionSheetObj.equipmentKind := EQUIPMENTKIND_HIGH_VOLTAGE;

  try
    DisableControls([frmENInspectionSheetAdd.spbInspectionSheet, frmENInspectionSheetAdd.edtName]);
    frmENInspectionSheetAdd.edtName.Text := 'Лист огляду - ' + ENSubst150CellObj.name;

    if frmENInspectionSheetAdd.ShowModal = mrOk then
    begin
      if frmENInspectionSheetAdd.ENInspectionSheetObj <> nil then
        pcENSubst150CellChange(Sender);
    end;
  finally
    frmENInspectionSheetAdd.Free;
    frmENInspectionSheetAdd:=nil;
  end;
end;


procedure TfrmENSubst150CellEdit.actInsertExecute(Sender: TObject);
begin
  if ENSubst150CellObj = nil then Exit;
  if ENSubst150CellObj.code = Low(Integer) then Exit;  

  // start  tsSubst150Switch   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Switch) then
  begin
    ENSubst150SwitchObj := ENSubst150Switch.Create;
    ENSubst150SwitchObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150SwitchObj.cellRef.code := ENSubst150CellObj.code;
    try
      frmENSubst150SwitchEdit := TfrmENSubst150SwitchEdit.Create(Application, dsInsert);
      try
        if frmENSubst150SwitchEdit.ShowModal = mrOk then
        begin
          if ENSubst150SwitchObj <> nil then
          pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150SwitchEdit.Free;
        frmENSubst150SwitchEdit:=nil;
      end;
    finally
      ENSubst150SwitchObj.Free;
    end;
  end;
  // end  tsSubst150Switch   ---------------

  // start  tsSubst150CurrentTrans   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150CurrentTrans) then
  begin
    ENSubst150CurrentTransObj := ENSubst150CurrentTrans.Create;
    ENSubst150CurrentTransObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150CurrentTransObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150CurrentTransEdit := TfrmENSubst150CurrentTransEdit.Create(Application, dsInsert);
      try
        if frmENSubst150CurrentTransEdit.ShowModal = mrOk then
        begin
          if ENSubst150CurrentTransObj <> nil then
             pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150CurrentTransEdit.Free;
        frmENSubst150CurrentTransEdit:=nil;
      end;
    finally
      ENSubst150CurrentTransObj.Free;
    end;
  end;
  // end  tsSubst150CurrentTrans   ---------------

  // start  tsSubst150Disconnector   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Disconnector) then
  begin
    ENSubst150DisconnectorObj := ENSubst150Disconnector.Create;
    ENSubst150DisconnectorObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150DisconnectorObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150DisconnectorEdit := TfrmENSubst150DisconnectorEdit.Create(Application, dsInsert);
      try
        if frmENSubst150DisconnectorEdit.ShowModal = mrOk then
        begin
          if ENSubst150DisconnectorObj <> nil then
            pcENSubst150CellChange(Sender);
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

  // start  tsSubst150Discharger   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Discharger) then
  begin
    ENSubst150DischargerObj := ENSubst150Discharger.Create;
    SetNullIntProps(ENSubst150DischargerObj);
    SetNullXSProps(ENSubst150DischargerObj);

    ENSubst150DischargerObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150DischargerObj.cellRef.code := ENSubst150CellObj.code;
    ENSubst150DischargerObj.substationRef := ENSubstation150Ref.Create;
    ENSubst150DischargerObj.substationRef.code := ENSubst150CellObj.substationRef.code;
    ENSubst150DischargerObj.voltageClassRef := ENVoltageClassRef.Create;
    ENSubst150DischargerObj.voltageClassRef.code := ENSubst150CellObj.voltageClassRef.code;

    try
      frmENSubst150DischargerEdit := TfrmENSubst150DischargerEdit.Create(Application, dsInsert);
      DisableControls([frmENSubst150DischargerEdit.edtVoltageClass, frmENSubst150DischargerEdit.spbVoltageClass]);

      try
        if frmENSubst150DischargerEdit.ShowModal = mrOk then
        begin
          if ENSubst150DischargerObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150DischargerEdit.Free;
        frmENSubst150DischargerEdit:=nil;
      end;
    finally
      ENSubst150DischargerObj.Free;
    end;

  end;
  // end  tsSubst150Discharger   ---------------

  // start  tsSubst150ShortCircuiter   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ShortCircuiter) then
  begin
    ENSubst150ShortCircuiterObj := ENSubst150ShortCircuiter.Create;
    ENSubst150ShortCircuiterObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150ShortCircuiterObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150ShortCircuiterEdit := TfrmENSubst150ShortCircuiterEdit.Create(Application, dsInsert);
      try
        if frmENSubst150ShortCircuiterEdit.ShowModal = mrOk then
        begin
          if ENSubst150ShortCircuiterObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150ShortCircuiterEdit.Free;
        frmENSubst150ShortCircuiterEdit:=nil;
      end;
    finally
      ENSubst150ShortCircuiterObj.Free;
    end;
  end;
  // end  tsSubst150ShortCircuiter   ---------------

  // start  tsSubst150Separator   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Separator) then
  begin
    ENSubst150SeparatorObj := ENSubst150Separator.Create;
    ENSubst150SeparatorObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150SeparatorObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150SeparatorEdit := TfrmENSubst150SeparatorEdit.Create(Application, dsInsert);
      try
        if frmENSubst150SeparatorEdit.ShowModal = mrOk then
        begin
          if ENSubst150SeparatorObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150SeparatorEdit.Free;
        frmENSubst150SeparatorEdit:=nil;
      end;
    finally
      ENSubst150SeparatorObj.Free;
    end;
  end;
  // end  tsSubst150Separator   ---------------

  // start  tsSubst150TN   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TN) then
  begin
    ENSubst150TNObj := ENSubst150TN.Create;
    ENSubst150TNObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150TNObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150TNEdit := TfrmENSubst150TNEdit.Create(Application, dsInsert);
      try
        if frmENSubst150TNEdit.ShowModal = mrOk then
        begin
          if ENSubst150TNObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150TNEdit.Free;
        frmENSubst150TNEdit:=nil;
      end;
    finally
      ENSubst150TNObj.Free;
    end;
  end;
  // end  tsSubst150TN   ---------------

  // start  tsSubst150RZA   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150RZA) then
  begin
    ENSubst150RZAObj := ENSubst150RZA.Create;
    ENSubst150RZAObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150RZAObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150RZAEdit := TfrmENSubst150RZAEdit.Create(Application, dsInsert);
      try
        if frmENSubst150RZAEdit.ShowModal = mrOk then
        begin
          if ENSubst150RZAObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150RZAEdit.Free;
        frmENSubst150RZAEdit:=nil;
      end;
    finally
      ENSubst150RZAObj.Free;
    end;
  end;
  // end  tsSubst150RZA   ---------------

  // start  tsSubst150TVP   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TVP) then
  begin
    ENSubst150TVPObj := ENSubst150TVP.Create;
    ENSubst150TVPObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150TVPObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150TVPEdit := TfrmENSubst150TVPEdit.Create(Application, dsInsert);
      try
        if frmENSubst150TVPEdit.ShowModal = mrOk then
        begin
          if ENSubst150TVPObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150TVPEdit.Free;
        frmENSubst150TVPEdit:=nil;
      end;
    finally
      ENSubst150TVPObj.Free;
    end;
  end;
  // end  tsSubst150TVP   ---------------


  // start  tsSubst150DGK   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150DGK) then
  begin
    ENSubst150DGKObj := ENSubst150DGK.Create;
    ENSubst150DGKObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150DGKObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150DGKEdit := TfrmENSubst150DGKEdit.Create(Application, dsInsert);
      try
        if frmENSubst150DGKEdit.ShowModal = mrOk then
        begin
          if ENSubst150DGKObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150DGKEdit.Free;
        frmENSubst150DGKEdit:=nil;
      end;
    finally
      ENSubst150DGKObj.Free;
    end;
  end;
  // end  tsSubst150DGK   ---------------

    // start  tsSubst150PullOutElement   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150PullOutElement) then
  begin
    ENSubst150PullOutElementObj := ENSubst150PullOutElement.Create;
    ENSubst150PullOutElementObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150PullOutElementObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150PullOutElementEdit := TfrmENSubst150PullOutElementEdit.Create(Application, dsInsert);
      try
        if frmENSubst150PullOutElementEdit.ShowModal = mrOk then
        begin
          if ENSubst150PullOutElementObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150PullOutElementEdit.Free;
        frmENSubst150PullOutElementEdit:=nil;
      end;
    finally
      ENSubst150PullOutElementObj.Free;
    end;
  end;
  // end  tsSubst150PullOutElement   ---------------

  // start  tsSubst150TireSection   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TireSection) then
  begin
    ENSubst150TireSectionObj := ENSubst150TireSection.Create;
    ENSubst150TireSectionObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150TireSectionObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150TireSectionEdit := TfrmENSubst150TireSectionEdit.Create(Application, dsInsert);
      try
        if frmENSubst150TireSectionEdit.ShowModal = mrOk then
        begin
          if ENSubst150TireSectionObj <> nil then
            pcENSubst150CellChange(Sender);
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


  // start  tsSubst150ControlCable   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ControlCable) then
  begin
    ENSubst150ControlCableObj := ENSubst150ControlCable.Create;
    ENSubst150ControlCableObj.cellRef := ENSubst150CellRef.Create;
    ENSubst150ControlCableObj.cellRef.code := ENSubst150CellObj.code;

    try
      frmENSubst150ControlCableEdit := TfrmENSubst150ControlCableEdit.Create(Application, dsInsert);
      try
        if frmENSubst150ControlCableEdit.ShowModal = mrOk then
        begin
          if ENSubst150ControlCableObj <> nil then
            pcENSubst150CellChange(Sender);
        end;
      finally
        frmENSubst150ControlCableEdit.Free;
        frmENSubst150ControlCableEdit:=nil;
      end;
    finally
      ENSubst150ControlCableObj.Free;
    end;
  end;
  // end  tsSubst150ControlCable   ---------------
end;


procedure TfrmENSubst150CellEdit.actSendToSigningExecute(Sender: TObject);
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
    pcENSubst150CellChange(Sender);
  end;
end;


procedure TfrmENSubst150CellEdit.actSignedExecute(Sender: TObject);
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
    pcENSubst150CellChange(Sender);
  end;
end;


procedure TfrmENSubst150CellEdit.actCopySheetExecute(Sender: TObject);
var
  newSheetCode, objCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
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

    pcENSubst150CellChange(Sender);
  end;
end;


procedure TfrmENSubst150CellEdit.actDeleteENInspectionSheetExecute(Sender: TObject);
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

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Лист огляду об`єкта енергетики)?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.remove(sheetCode);
    pcENSubst150CellChange(Sender);
  end;
end;


procedure TfrmENSubst150CellEdit.actDeleteExecute(Sender: TObject);
var
  objCode : Integer;
  TempENSubst150Switch : ENSubst150SwitchControllerSoapPort;
  TempENSubst150CurrentTrans : ENSubst150CurrentTransControllerSoapPort;
  TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
  TempENSubst150Discharger : ENSubst150DischargerControllerSoapPort;
  TempENSubst150ShortCircuiter : ENSubst150ShortCircuiterControllerSoapPort;
  TempENSubst150Separator : ENSubst150SeparatorControllerSoapPort;
  TempENSubst150TN : ENSubst150TNControllerSoapPort;
  TempENSubst150RZA : ENSubst150RZAControllerSoapPort;
  TempENSubst150TVP : ENSubst150TVPControllerSoapPort;
  TempENSubst150DGK : ENSubst150DGKControllerSoapPort;
  TempENSubst150PullOutElement : ENSubst150PullOutElementControllerSoapPort;
  TempENSubst150TireSection : ENSubst150TireSectionControllerSoapPort;
  TempENSubst150ControlCable : ENSubst150ControlCableControllerSoapPort;
begin

  // start  tsSubst150Switch   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Switch) then
  begin
    TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150Switch.Cells[0,sgENSubst150Switch.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Выключатель) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENSubst150Switch.remove(objCode);
      pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150Switch   ---------------

  // start  tsSubst150CurrentTrans   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150CurrentTrans) then
  begin
    TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150CurrentTrans.Cells[0,sgENSubst150CurrentTrans.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Трансформатор тока) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150CurrentTrans.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150CurrentTrans   ---------------

  // start  tsSubst150Disconnector   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Disconnector) then
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
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150Disconnector   ---------------

  // start  tsSubst150Discharger   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Discharger) then
  begin
    TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150Discharger.Cells[0,sgENSubst150Discharger.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Разрядник (ОПН)) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150Discharger.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150Discharger   ---------------

  // start  tsSubst150ShortCircuiter   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ShortCircuiter) then
  begin
    TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150ShortCircuiter.Cells[0,sgENSubst150ShortCircuiter.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Короткозамыкатель) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150ShortCircuiter.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150ShortCircuiter   ---------------

  // start  tsSubst150Separator   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Separator) then
  begin
    TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150Separator.Cells[0,sgENSubst150Separator.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Отделитель) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150Separator.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150Separator   ---------------

  // start  tsSubst150TN   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TN) then
  begin
    TempENSubst150TN := HTTPRIOENSubst150TN as ENSubst150TNControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150TN.Cells[0,sgENSubst150TN.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (ТН) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150TN.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150TN   ---------------


  // start  tsSubst150RZA ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150RZA) then
  begin
    TempENSubst150RZA := HTTPRIOENSubst150RZA as ENSubst150RZAControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150RZA.Cells[0,sgENSubst150RZA.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (РЗА) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150RZA.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150RZA ---------------

  // start  tsSubst150TVP   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TVP) then
  begin
    TempENSubst150TVP := HTTPRIOENSubst150TVP as ENSubst150TVPControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150TVP.Cells[0,sgENSubst150TVP.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (ТВП) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150TVP.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150TVP   ---------------

  // start  tsSubst150DGK   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150DGK) then
  begin
    TempENSubst150DGK := HTTPRIOENSubst150DGK as ENSubst150DGKControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150DGK.Cells[0,sgENSubst150DGK.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Отделитель) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150DGK.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150DGK   ---------------


  // start  tsSubst150PullOutElement   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150PullOutElement) then
  begin
    TempENSubst150PullOutElement := HTTPRIOENSubst150PullOutElement as ENSubst150PullOutElementControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150PullOutElement.Cells[0,sgENSubst150PullOutElement.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Викатной элемент) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150PullOutElement.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150PullOutElement   ---------------


  // start  tsSubst150TireSection   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TireSection) then
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
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150TireSection   ---------------

  // start  tsSubst150ControlCable   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ControlCable) then
  begin
    TempENSubst150ControlCable := HTTPRIOENSubst150ControlCable as ENSubst150ControlCableControllerSoapPort;
    try
      objCode := StrToInt(sgENSubst150ControlCable.Cells[0,sgENSubst150ControlCable.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Контр.Каб.) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempENSubst150ControlCable.remove(objCode);
        pcENSubst150CellChange(Sender);
    end;
  end;
  // end  tsSubst150ControlCable   ---------------

end;


procedure TfrmENSubst150CellEdit.actEditENInspectionSheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsEdit);

  try
    frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  try
    if frmENInspectionSheetEdit.ShowModal= mrOk then
    begin
      pcENSubst150CellChange(Sender);
    end;
  finally
    frmENInspectionSheetEdit.Free;
    frmENInspectionSheetEdit:=nil;
  end;
end;


procedure TfrmENSubst150CellEdit.actEditExecute(Sender: TObject);
var
  TempENSubst150Switch : ENSubst150SwitchControllerSoapPort;
  TempENSubst150CurrentTrans : ENSubst150CurrentTransControllerSoapPort;
  TempENSubst150Disconnector : ENSubst150DisconnectorControllerSoapPort;
  TempENSubst150Discharger : ENSubst150DischargerControllerSoapPort;
  TempENSubst150ShortCircuiter : ENSubst150ShortCircuiterControllerSoapPort;
  TempENSubst150Separator : ENSubst150SeparatorControllerSoapPort;
  TempENSubst150Tn: ENSubst150TnControllerSoapPort;
  TempENSubst150RZA: ENSubst150RZAControllerSoapPort;
  TempENSubst150TVP: ENSubst150TVPControllerSoapPort;
  TempENSubst150DGK: ENSubst150DGKControllerSoapPort;
  TempENSubst150PullOutElement: ENSubst150PullOutElementControllerSoapPort;
  TempENSubst150TireSection: ENSubst150TireSectionControllerSoapPort;
  TempENSubst150ControlCable: ENSubst150ControlCableControllerSoapPort;
begin

  // start  tsSubst150Switch   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Switch) then
  begin
    TempENSubst150Switch := HTTPRIOENSubst150Switch as ENSubst150SwitchControllerSoapPort;
    try
      ENSubst150SwitchObj := TempENSubst150Switch.getObject(StrToInt(sgENSubst150Switch.Cells[0,sgENSubst150Switch.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150SwitchEdit := TfrmENSubst150SwitchEdit.Create(Application, dsEdit);
    try
      if frmENSubst150SwitchEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150SwitchEdit.Free;
      frmENSubst150SwitchEdit:=nil;
    end;
  end;
  // end  tsSubst150Switch   ---------------

  // start  tsSubst150Switch   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150CurrentTrans) then
  begin
    TempENSubst150CurrentTrans := HTTPRIOENSubst150CurrentTrans as ENSubst150CurrentTransControllerSoapPort;
    try
      ENSubst150CurrentTransObj := TempENSubst150CurrentTrans.getObject(StrToInt(sgENSubst150CurrentTrans.Cells[0,sgENSubst150CurrentTrans.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150CurrentTransEdit:=TfrmENSubst150CurrentTransEdit.Create(Application, dsEdit);
    try
      if frmENSubst150CurrentTransEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150CurrentTransEdit.Free;
      frmENSubst150CurrentTransEdit:=nil;
    end;
  end;
  // end  tsSubst150Switch   ---------------

  // start  tsSubst150Disconnector   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Disconnector) then
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
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150DisconnectorEdit.Free;
      frmENSubst150DisconnectorEdit:=nil;
    end;
  end;
  // end  tsSubst150Disconnector   ---------------

  // start  tsSubst150Discharger   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Discharger) then
  begin
    TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
    try
      ENSubst150DischargerObj := TempENSubst150Discharger.getObject(StrToInt(sgENSubst150Discharger.Cells[0,sgENSubst150Discharger.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150DischargerEdit := TfrmENSubst150DischargerEdit.Create(Application, dsEdit);
    try
      if frmENSubst150DischargerEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150DischargerEdit.Free;
      frmENSubst150DischargerEdit:=nil;
    end;
  end;
  // end  tsSubst150Discharger   ---------------

  // start  tsSubst150ShortCircuiter   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ShortCircuiter) then
  begin
    TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
    try
      ENSubst150ShortCircuiterObj := TempENSubst150ShortCircuiter.getObject(StrToInt(sgENSubst150ShortCircuiter.Cells[0,sgENSubst150ShortCircuiter.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150ShortCircuiterEdit := TfrmENSubst150ShortCircuiterEdit.Create(Application, dsEdit);
    try
      if frmENSubst150ShortCircuiterEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150ShortCircuiterEdit.Free;
      frmENSubst150ShortCircuiterEdit:=nil;
    end;
  end;
  // end  tsSubst150ShortCircuiter   ---------------

 // start  tsSubst150Separator   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150Separator) then
  begin
    TempENSubst150Separator := HTTPRIOENSubst150Separator as ENSubst150SeparatorControllerSoapPort;
    try
      ENSubst150SeparatorObj := TempENSubst150Separator.getObject(StrToInt(sgENSubst150Separator.Cells[0,sgENSubst150Separator.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150SeparatorEdit := TfrmENSubst150SeparatorEdit.Create(Application, dsEdit);
    try
      if frmENSubst150SeparatorEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150SeparatorEdit.Free;
      frmENSubst150SeparatorEdit:=nil;
    end;
  end;
  // end  tsSubst150Separator   ---------------

  // start  tsSubst150TN   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TN) then
  begin
    TempENSubst150TN := HTTPRIOENSubst150TN as ENSubst150TNControllerSoapPort;
    try
      ENSubst150TNObj := TempENSubst150TN.getObject(StrToInt(sgENSubst150TN.Cells[0,sgENSubst150TN.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150TNEdit := TfrmENSubst150TNEdit.Create(Application, dsEdit);
    try
      if frmENSubst150TNEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150TNEdit.Free;
      frmENSubst150TNEdit:=nil;
    end;
  end;
  // end  tsSubst150TN   ---------------


  // start  tsSubst150RZA   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150RZA) then
  begin
    TempENSubst150RZA := HTTPRIOENSubst150RZA as ENSubst150RZAControllerSoapPort;
    try
      ENSubst150RZAObj := TempENSubst150RZA.getObject(StrToInt(sgENSubst150RZA.Cells[0,sgENSubst150RZA.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150RZAEdit := TfrmENSubst150RZAEdit.Create(Application, dsEdit);
    try
      if frmENSubst150RZAEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150RZAEdit.Free;
      frmENSubst150RZAEdit:=nil;
    end;
  end;
  // end  tsSubst150RZA   ---------------

  // start  tsSubst150TVP   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TVP) then
  begin
    TempENSubst150TVP := HTTPRIOENSubst150TVP as ENSubst150TVPControllerSoapPort;
    try
      ENSubst150TVPObj := TempENSubst150TVP.getObject(StrToInt(sgENSubst150TVP.Cells[0,sgENSubst150TVP.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150TVPEdit := TfrmENSubst150TVPEdit.Create(Application, dsEdit);
    try
      if frmENSubst150TVPEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150TVPEdit.Free;
      frmENSubst150TVPEdit:=nil;
    end;
  end;
  // end  tsSubst150TVP   ---------------

  // start  tsSubst150DGK   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150DGK) then
  begin
    TempENSubst150DGK := HTTPRIOENSubst150DGK as ENSubst150DGKControllerSoapPort;
    try
      ENSubst150DGKObj := TempENSubst150DGK.getObject(StrToInt(sgENSubst150DGK.Cells[0,sgENSubst150DGK.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150DGKEdit := TfrmENSubst150DGKEdit.Create(Application, dsEdit);
    try
      if frmENSubst150DGKEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150DGKEdit.Free;
      frmENSubst150DGKEdit:=nil;
    end;
  end;
  // end  tsSubst150DGK   ---------------

  // start  tsSubst150PullOutElement   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150PullOutElement) then
  begin
    TempENSubst150PullOutElement := HTTPRIOENSubst150PullOutElement as ENSubst150PullOutElementControllerSoapPort;
    try
      ENSubst150PullOutElementObj := TempENSubst150PullOutElement.getObject(StrToInt(sgENSubst150PullOutElement.Cells[0,sgENSubst150PullOutElement.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150PullOutElementEdit := TfrmENSubst150PullOutElementEdit.Create(Application, dsEdit);
    try
      if frmENSubst150PullOutElementEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150PullOutElementEdit.Free;
      frmENSubst150PullOutElementEdit:=nil;
    end;
  end;
  // end  tsSubst150PullOutElement   ---------------


  // start  tsSubst150TireSection   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150TireSection) then
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
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150TireSectionEdit.Free;
      frmENSubst150TireSectionEdit:=nil;
    end;
  end;
  // end  tsSubst150TireSection   ---------------


  // start  tsSubst150ControlCable   ---------------
  if (pcENSubst150Cell.ActivePage = tsSubst150ControlCable) then
  begin
    TempENSubst150ControlCable := HTTPRIOENSubst150ControlCable as ENSubst150ControlCableControllerSoapPort;
    try
      ENSubst150ControlCableObj := TempENSubst150ControlCable.getObject(StrToInt(sgENSubst150ControlCable.Cells[0,sgENSubst150ControlCable.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENSubst150ControlCableEdit := TfrmENSubst150ControlCableEdit.Create(Application, dsEdit);
    try
      if frmENSubst150ControlCableEdit.ShowModal= mrOk then
        begin
          pcENSubst150CellChange(Sender);
        end;
    finally
      frmENSubst150ControlCableEdit.Free;
      frmENSubst150ControlCableEdit:=nil;
    end;
  end;
  // end  tsSubst150ControlCable   ---------------
end;


procedure TfrmENSubst150CellEdit.actUnSignedExecute(Sender: TObject);
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

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання листа огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigned(sheetCode);
    pcENSubst150CellChange(Sender);
  end;
end;


procedure TfrmENSubst150CellEdit.actUnSigningExecute(Sender: TObject);
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
    pcENSubst150CellChange(Sender);
  end;
end;


procedure TfrmENSubst150CellEdit.actUpdateENInspectionSheetExecute(Sender: TObject);
begin
  inherited;
  pcENSubst150CellChange(Sender);
end;


procedure TfrmENSubst150CellEdit.actUpdateExecute(Sender: TObject);
begin
  pcENSubst150CellChange(Sender);
end;

end.
