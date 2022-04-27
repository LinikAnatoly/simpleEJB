
unit EditENConnectionTariff;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENConnectionTariffController,
  AdvObj ;

type
  TfrmENConnectionTariffEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
  

  HTTPRIOENConnectionTariff: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcConnectionTariff: TPageControl;
    tsGeneral: TTabSheet;
    tsConnectionTariffEntry: TTabSheet;
    lblName: TLabel;
    spbENConnectionLevelLevelRef: TSpeedButton;
    lblENConnectionLevelLevelRefName: TLabel;
    spbENPowerReliabilityCategoryCategoryRef: TSpeedButton;
    lblENPowerReliabilityCategoryCategoryRefName: TLabel;
    spbENConnectionPowerPointPowerPointRef: TSpeedButton;
    lblENConnectionPowerPointPowerPointRefName: TLabel;
    spbENConnectionPhasityPhasityRef: TSpeedButton;
    lblENConnectionPhasityPhasityRefName: TLabel;
    edtName: TEdit;
    edtENConnectionLevelLevelRefName: TEdit;
    edtENPowerReliabilityCategoryCategoryRefName: TEdit;
    edtENConnectionPowerPointPowerPointRefName: TEdit;
    edtENConnectionPhasityPhasityRefName: TEdit;
    ImageList1: TImageList;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENConnectionTariffEntry: TAdvStringGrid;
    HTTPRIOENConnectionTariffEntry: THTTPRIO;
    lblLineType: TLabel;
    edtLineType: TEdit;
    spbLineType: TSpeedButton;
    spbInstallationType: TSpeedButton;
    edtInstallationType: TEdit;
    lblInstallationType: TLabel;
    lblLocationType: TLabel;
    edtLocationType: TEdit;
    spbLocationType: TSpeedButton;
    spbTariffType: TSpeedButton;
    edtTariffType: TEdit;
    lblTariffType: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    lblDepartment: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENConnectionLevelLevelRefClick(Sender : TObject);
  procedure spbENPowerReliabilityCategoryCategoryRefClick(Sender : TObject);
  procedure spbENConnectionPowerPointPowerPointRefClick(Sender : TObject);
  procedure spbENConnectionPhasityPhasityRefClick(Sender : TObject);
  procedure pcConnectionTariffChange(Sender: TObject);
  procedure actViewExecute(Sender: TObject);
  procedure actInsertExecute(Sender: TObject);
  procedure UpdateGrid(Sender: TObject);
  procedure actDeleteExecute(Sender: TObject);
  procedure actEditExecute(Sender: TObject);
  procedure actUpdateExecute(Sender: TObject);
    procedure spbLineTypeClick(Sender: TObject);
    procedure spbInstallationTypeClick(Sender: TObject);
    procedure spbLocationTypeClick(Sender: TObject);
    procedure spbTariffTypeClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENConnectionTariffEdit: TfrmENConnectionTariffEdit;
  ENConnectionTariffObj: ENConnectionTariff;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionTariffEntryHeaders: array [1..3] of String =
        ( 'Код'
          ,'Ставка (тис. грн/1 кВт)'
          ,'Дата початку дії'
        );


implementation

uses
  ShowENConnectionLevel
  ,ENConnectionLevelController
  ,ShowENPowerReliabilityCategory
  ,ENPowerReliabilityCategoryController
  ,ShowENConnectionPowerPoint
  ,ENConnectionPowerPointController
  ,ShowENConnectionPhasity
  ,ENConnectionPhasityController
  , ENConnectionTariffEntryController
, EditENConnectionTariffEntry, ShowENConnectionLineType,
  ENConnectionLineTypeController, ShowENConnectionInstallationType,
  EditENAccumulatorInstallation, ENConnectionInstallationTypeController,
  ENConnectionLocationTypeController, ShowENConnectionLocationType,
  EditENConnectionTariffType, ENConnectionTariffTypeController,
  ShowENConnectionTariffType, ShowENDepartment, ENDepartmentController;

{uses  
    EnergyproController, EnergyproController2, ENConnectionTariffController  ;
}
{$R *.dfm}



procedure TfrmENConnectionTariffEdit.FormShow(Sender: TObject);
var
  ENConnectionTariffShortObj : ENConnectionTariffShort;
  TempENConnectionTariff : ENConnectionTariffControllerSoapPort;
begin

  SetGridHeaders(ENConnectionTariffEntryHeaders, sgENConnectionTariffEntry.ColumnHeaders);
  TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
  pcConnectionTariff.ActivePage := tsGeneral;
  tsConnectionTariffEntry.TabVisible := (DialogState <> dsInsert);

  DisableControls([edtCode, edtName, edtENConnectionLevelLevelRefName, edtENPowerReliabilityCategoryCategoryRefName,
     edtENConnectionPowerPointPowerPointRefName, edtENConnectionPhasityPhasityRefName,
     edtTariffType, edtLineType, edtInstallationType, edtLocationType, edtDepartment]);

  if (DialogState = dsView) then
  DisableActions([actInsert, actEdit, actDelete]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENConnectionLevelLevelRefName
      ,spbENConnectionLevelLevelRef
      ,edtENPowerReliabilityCategoryCategoryRefName
      ,spbENPowerReliabilityCategoryCategoryRef
      ,edtENConnectionPowerPointPowerPointRefName
      ,spbENConnectionPowerPointPowerPointRef
      ,edtENConnectionPhasityPhasityRefName
      ,spbENConnectionPhasityPhasityRef
      ,edtTariffType
      ,spbTariffType
      ,edtLineType
      ,spbLineType
      ,edtLocationType
      ,spbLocationType
      ,edtInstallationType
      ,spbInstallationType
      ,edtDepartment
      ,spbDepartment
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENConnectionTariffObj.code);
    edtName.Text := ENConnectionTariffObj.name;

    ENConnectionTariffShortObj := TempENConnectionTariff.getShortObject(ENConnectionTariffObj.code);

    edtENConnectionLevelLevelRefName.Text := ENConnectionTariffShortObj.levelRefName;
    edtENPowerReliabilityCategoryCategoryRefName.Text := ENConnectionTariffShortObj.categoryRefName;
    edtENConnectionPowerPointPowerPointRefName.Text := ENConnectionTariffShortObj.powerPointRefName;
    edtENConnectionPhasityPhasityRefName.Text := ENConnectionTariffShortObj.phasityRefName;
    edtTariffType.Text := ENConnectionTariffShortObj.tarifTypeRefName;
    edtLineType.Text := ENConnectionTariffShortObj.lineTypeRefName;
    edtInstallationType.Text := ENConnectionTariffShortObj.installationTypeRefName;
    edtLocationType.Text := ENConnectionTariffShortObj.locationTypeRefName;
    edtDepartment.Text := ENConnectionTariffShortObj.departmentRefShortName;
  end;
end;



procedure TfrmENConnectionTariffEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionTariff: ENConnectionTariffControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
    ENConnectionTariffObj.name := edtName.Text;

    if DialogState = dsInsert then
    begin
      ENConnectionTariffObj.code:=low(Integer);
      TempENConnectionTariff.add(ENConnectionTariffObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionTariff.save(ENConnectionTariffObj);
    end;
  end;
end;


procedure TfrmENConnectionTariffEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;

begin

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.departmentRef = nil
               then ENConnectionTariffObj.departmentRef := ENDepartmentRef.Create();
               ENConnectionTariffObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;

               edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENConnectionTariffEdit.spbENConnectionLevelLevelRefClick(Sender : TObject);
var 
   frmENConnectionLevelShow: TfrmENConnectionLevelShow;
begin
   frmENConnectionLevelShow:=TfrmENConnectionLevelShow.Create(Application,fmNormal);
   try
      with frmENConnectionLevelShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.levelRef = nil then ENConnectionTariffObj.levelRef := ENConnectionLevelRef.Create();
               ENConnectionTariffObj.levelRef.code := StrToInt(GetReturnValue(sgENConnectionLevel,0));
               edtENConnectionLevelLevelRefName.Text:=GetReturnValue(sgENConnectionLevel,1);

               edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLevelShow.Free;
   end;
end;



procedure TfrmENConnectionTariffEdit.spbENPowerReliabilityCategoryCategoryRefClick(Sender : TObject);
var 
   frmENPowerReliabilityCategoryShow: TfrmENPowerReliabilityCategoryShow;
begin
   frmENPowerReliabilityCategoryShow:=TfrmENPowerReliabilityCategoryShow.Create(Application,fmNormal);
   try
      with frmENPowerReliabilityCategoryShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.categoryRef = nil then ENConnectionTariffObj.categoryRef := ENPowerReliabilityCategoryRef.Create();
               ENConnectionTariffObj.categoryRef.code := StrToInt(GetReturnValue(sgENPowerReliabilityCategory,0));
               edtENPowerReliabilityCategoryCategoryRefName.Text :=
                 GetReturnValue(sgENPowerReliabilityCategory,1) + ' - ' + GetReturnValue(sgENPowerReliabilityCategory,2);

             edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPowerReliabilityCategoryShow.Free;
   end;
end;



procedure TfrmENConnectionTariffEdit.spbInstallationTypeClick(Sender: TObject);
var
   frmENConnectionInstallationTypeShow: TfrmENConnectionInstallationTypeShow;
begin
   frmENConnectionInstallationTypeShow:=TfrmENConnectionInstallationTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionInstallationTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.installationTypeRef = nil then
               ENConnectionTariffObj.installationTypeRef := ENConnectionInstallationTypeRef.Create();
               ENConnectionTariffObj.installationTypeRef.code := StrToInt(GetReturnValue(sgENConnectionInstallationType,0));
               edtInstallationType.Text:=GetReturnValue(sgENConnectionInstallationType,1);

               edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionInstallationTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffEdit.spbLineTypeClick(Sender: TObject);
var
   frmENConnectionLineTypeShow: TfrmENConnectionLineTypeShow;
begin
   frmENConnectionLineTypeShow:=TfrmENConnectionLineTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionLineTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.lineTypeRef = nil then
               ENConnectionTariffObj.lineTypeRef := ENConnectionLineTypeRef.Create();
               ENConnectionTariffObj.lineTypeRef.code := StrToInt(GetReturnValue(sgENConnectionLineType,0));
               edtLineType.Text:=GetReturnValue(sgENConnectionLineType,1);

               edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLineTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffEdit.spbLocationTypeClick(Sender: TObject);
var
   frmENConnectionLocationTypeShow: TfrmENConnectionLocationTypeShow;
begin
   frmENConnectionLocationTypeShow:=TfrmENConnectionLocationTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionLocationTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.locationTypeRef = nil then
               ENConnectionTariffObj.locationTypeRef := ENConnectionLocationTypeRef.Create();
               ENConnectionTariffObj.locationTypeRef.code := StrToInt(GetReturnValue(sgENConnectionLocationType,0));
               edtLocationType.Text:=GetReturnValue(sgENConnectionLocationType,1);

               edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionLocationTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffEdit.spbTariffTypeClick(Sender: TObject);
var
   frmENConnectionTariffTypeShow: TfrmENConnectionTariffTypeShow;
begin
   frmENConnectionTariffTypeShow:=TfrmENConnectionTariffTypeShow.Create(Application,fmNormal);
   try
      with frmENConnectionTariffTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.tarifTypeRef = nil then
               ENConnectionTariffObj.tarifTypeRef := ENConnectionTariffTypeRef.Create();
               ENConnectionTariffObj.tarifTypeRef.code := StrToInt(GetReturnValue(sgENConnectionTariffType,0));
               edtTariffType.Text:=GetReturnValue(sgENConnectionTariffType,1);

               edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionTariffTypeShow.Free;
   end;
end;

procedure TfrmENConnectionTariffEdit.spbENConnectionPowerPointPowerPointRefClick(Sender : TObject);
var 
   frmENConnectionPowerPointShow: TfrmENConnectionPowerPointShow;
begin
   frmENConnectionPowerPointShow:=TfrmENConnectionPowerPointShow.Create(Application,fmNormal);
   try
      with frmENConnectionPowerPointShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.powerPointRef = nil then ENConnectionTariffObj.powerPointRef := ENConnectionPowerPointRef.Create();
               ENConnectionTariffObj.powerPointRef.code := StrToInt(GetReturnValue(sgENConnectionPowerPoint,0));
               edtENConnectionPowerPointPowerPointRefName.Text:=GetReturnValue(sgENConnectionPowerPoint,1);

               edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionPowerPointShow.Free;
   end;
end;



procedure TfrmENConnectionTariffEdit.spbENConnectionPhasityPhasityRefClick(Sender : TObject);
var 
   frmENConnectionPhasityShow: TfrmENConnectionPhasityShow;
begin
   frmENConnectionPhasityShow:=TfrmENConnectionPhasityShow.Create(Application,fmNormal);
   try
      with frmENConnectionPhasityShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffObj.phasityRef = nil then ENConnectionTariffObj.phasityRef := ENConnectionPhasityRef.Create();
               ENConnectionTariffObj.phasityRef.code := StrToInt(GetReturnValue(sgENConnectionPhasity,0));
               edtENConnectionPhasityPhasityRefName.Text:=GetReturnValue(sgENConnectionPhasity,1);

              edtName.Text := edtTariffType.Text + ' / ' + edtENConnectionLevelLevelRefName.Text + ' / ' + edtENPowerReliabilityCategoryCategoryRefName.Text
                  + ' / ' + edtENConnectionPowerPointPowerPointRefName.Text + ' / ' + edtENConnectionPhasityPhasityRefName.Text
                  + ' / ' + edtLineType.Text + ' / ' + edtInstallationType.Text + ' / ' + edtLocationType.Text + ' / ' + edtDepartment.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionPhasityShow.Free;
   end;
end;



procedure TfrmENConnectionTariffEdit.pcConnectionTariffChange(Sender: TObject);
var
  TempENConnectionTariffEntry : ENConnectionTariffEntryControllerSoapPort;
  i, iColCount, iLastCount, iLastRow : Integer;
  ENConnectionTariffEntryList : ENConnectionTariffEntryShortList;
  tariffEntryFilter : ENConnectionTariffEntryFilter;
begin
  // --------------  start tsConnectionTariffEntry
  if pcConnectionTariff.ActivePage = tsConnectionTariffEntry then
  begin
    iColCount := -1;
    TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;

    tariffEntryFilter := ENConnectionTariffEntryFilter.Create;
    SetNullIntProps(tariffEntryFilter);
    SetNullXSProps(tariffEntryFilter);

    if tariffEntryFilter.tariffRef = nil then tariffEntryFilter.tariffRef := ENConnectionTariffRef.Create;
    tariffEntryFilter.tariffRef.code := ENConnectionTariffObj.code;

    ENConnectionTariffEntryList := TempENConnectionTariffEntry.getScrollableFilteredList(tariffEntryFilter, 0, iColCount);
    iLastCount := High(ENConnectionTariffEntryList.list);

    if iLastCount > -1 then
       sgENConnectionTariffEntry.RowCount := iLastCount+2
    else
       sgENConnectionTariffEntry.RowCount := 2;

     with sgENConnectionTariffEntry do
      for i := 0 to iLastCount do
        begin
          Application.ProcessMessages;

          if ENConnectionTariffEntryList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENConnectionTariffEntryList.list[i].code)
          else
            Cells[0,i+1] := '';

          if ENConnectionTariffEntryList.list[i].value = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := ENConnectionTariffEntryList.list[i].value.DecimalString;

          if ENConnectionTariffEntryList.list[i].startDate = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(ENConnectionTariffEntryList.list[i].startDate);

          iLastRow := i+1;
          sgENConnectionTariffEntry.RowCount := iLastRow+1;
        end;
     iColCount := iColCount+1;
     sgENConnectionTariffEntry.Row := 1;
  end;
  // --------------  end tsConnectionTariffEntry
end;


procedure TfrmENConnectionTariffEdit.actViewExecute(Sender: TObject);
var TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
begin
  TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
  try
     ENConnectionTariffEntryObj := TempENConnectionTariffEntry.getObject(StrToInt(sgENConnectionTariffEntry.Cells[0,sgENConnectionTariffEntry.Row]));
   except
     on EConvertError do Exit;
  end;

  if ENConnectionTariffEntryObj.tariffRef = nil then ENConnectionTariffEntryObj.tariffRef := ENConnectionTariffRef.Create();
    ENConnectionTariffEntryObj.tariffRef.code := ENConnectionTariffObj.code;

  frmENConnectionTariffEntryEdit := TfrmENConnectionTariffEntryEdit.Create(Application, dsView);

  frmENConnectionTariffEntryEdit.edtENConnectionTariffTariffRefName.Text := ENConnectionTariffObj.name;

  DisableControls([frmENConnectionTariffEntryEdit.edtENConnectionTariffTariffRefName,
      frmENConnectionTariffEntryEdit.spbENConnectionTariffTariffRef]);

  try
    frmENConnectionTariffEntryEdit.ShowModal;
  finally
    frmENConnectionTariffEntryEdit.Free;
    frmENConnectionTariffEntryEdit:=nil;
  end;
end;

procedure TfrmENConnectionTariffEdit.actInsertExecute(Sender: TObject);
begin
  ENConnectionTariffEntryObj := ENConnectionTariffEntry.Create;

  try
    if ENConnectionTariffEntryObj.tariffRef = nil then ENConnectionTariffEntryObj.tariffRef := ENConnectionTariffRef.Create();
      ENConnectionTariffEntryObj.tariffRef.code := ENConnectionTariffObj.code;

    frmENConnectionTariffEntryEdit := TfrmENConnectionTariffEntryEdit.Create(Application, dsInsert);

    frmENConnectionTariffEntryEdit.edtENConnectionTariffTariffRefName.Text := ENConnectionTariffObj.name;

    DisableControls([frmENConnectionTariffEntryEdit.edtENConnectionTariffTariffRefName,
        frmENConnectionTariffEntryEdit.spbENConnectionTariffTariffRef]);

    try
      if frmENConnectionTariffEntryEdit.ShowModal = mrOk then
      begin
        if ENConnectionTariffEntryObj <> nil then
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionTariffEntryEdit.Free;
      frmENConnectionTariffEntryEdit:=nil;
    end;
  finally
    ENConnectionTariffEntryObj.Free;
  end;
end;

procedure TfrmENConnectionTariffEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENConnectionTariffEntry.RowCount-1 do
   for j:=0 to sgENConnectionTariffEntry.ColCount-1 do
     sgENConnectionTariffEntry.Cells[j,i]:='';
   pcConnectionTariffChange(Sender);
end;

procedure TfrmENConnectionTariffEdit.actDeleteExecute(Sender: TObject);
var
  TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
  ObjCode: Integer;
begin
  TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
  try
     ObjCode := StrToInt(sgENConnectionTariffEntry.Cells[0,sgENConnectionTariffEntry.Row]);
   except
     on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Значення ставок плати за стандартне приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionTariffEntry.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionTariffEdit.actEditExecute(Sender: TObject);
var
  TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
begin
  TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;
  try
     ENConnectionTariffEntryObj := TempENConnectionTariffEntry.getObject(StrToInt(sgENConnectionTariffEntry.Cells[0,sgENConnectionTariffEntry.Row]));
   except
     on EConvertError do Exit;
  end;

  if ENConnectionTariffEntryObj.tariffRef = nil then ENConnectionTariffEntryObj.tariffRef := ENConnectionTariffRef.Create();
    ENConnectionTariffEntryObj.tariffRef.code := ENConnectionTariffObj.code;

  frmENConnectionTariffEntryEdit := TfrmENConnectionTariffEntryEdit.Create(Application, dsEdit);

  frmENConnectionTariffEntryEdit.edtENConnectionTariffTariffRefName.Text := ENConnectionTariffObj.name;

  DisableControls([frmENConnectionTariffEntryEdit.edtENConnectionTariffTariffRefName,
      frmENConnectionTariffEntryEdit.spbENConnectionTariffTariffRef]);

  try
    if frmENConnectionTariffEntryEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionTariffEntryEdit.Free;
    frmENConnectionTariffEntryEdit:=nil;
  end;
end;

procedure TfrmENConnectionTariffEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


end.
