
unit ShowENInspectionSheetItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENInspectionSheetItemController, AdvObj, ENConsts ;


type
    TfrmENInspectionSheetItemShow = class(TChildForm)  
    HTTPRIOENInspectionSheetItem: THTTPRIO;
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
    sgENInspectionSheetItem: TAdvStringGrid;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENInspectionSheetItemTopLeftChanged(Sender: TObject);
    procedure sgENInspectionSheetItemDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENInspectionSheetItemShort; stdcall; static;
 end;


var
  frmENInspectionSheetItemShow: TfrmENInspectionSheetItemShow;
  
  
implementation

uses Main, EditENInspectionSheetItem, EditENInspectionSheetItemFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInspectionSheetItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Шифр дефекту'
          ,'Найменування (характеристика) дефекту'
          ,'Результат'
          ,'Кількість робіт (для плану)'
          ,'Коментар'
          ,'Кількість дефектів'
          ,'Коєфіцієнт імовірності відмовлення об''єкта Ki'
          ,'Бали дефекту Pi'
          ,'Вага дефекту Xi'
        );
   
class function TfrmENInspectionSheetItemShow.chooseFromList : ENInspectionSheetItemShort;
var
  f1 : ENInspectionSheetItemFilter;
  frmENInspectionSheetItemShow : TfrmENInspectionSheetItemShow;
  selected : ENInspectionSheetItemShort;
begin
  inherited;
     selected := nil;
     f1 := ENInspectionSheetItemFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENInspectionSheetItemShow := TfrmENInspectionSheetItemShow.Create(Application, fmNormal, f1);
       try
          with frmENInspectionSheetItemShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENInspectionSheetItemShort(sgENInspectionSheetItem.Objects[0, sgENInspectionSheetItem.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENInspectionSheetItemShow.Free;
       end;
end;

procedure TfrmENInspectionSheetItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENInspectionSheetItemShow:=nil;
  inherited;
end;


procedure TfrmENInspectionSheetItemShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENInspectionSheetItemShow.FormShow(Sender: TObject);
var
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
  i: Integer;
  ENInspectionSheetItemList: ENInspectionSheetItemShortList;
begin
  SetGridHeaders(ENInspectionSheetItemHeaders, sgENInspectionSheetItem.ColumnHeaders);
  ColCount:=100;
  TempENInspectionSheetItem :=  HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENInspectionSheetItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if FormMode = fmFiltered then DisableActions([actFilter, actNoFilter, actInsert, actDelete]);

  ENInspectionSheetItemList := TempENInspectionSheetItem.getScrollableFilteredList(ENInspectionSheetItemFilter(FilterObject),0,ColCount);
  LastCount:=High(ENInspectionSheetItemList.list);

  if LastCount > -1 then
     sgENInspectionSheetItem.RowCount:=LastCount+2
  else
     sgENInspectionSheetItem.RowCount:=2;

   with sgENInspectionSheetItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENInspectionSheetItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENInspectionSheetItemList.list[i].code)
        else
          Cells[0,i+1] := '';


        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode = Low(Integer) then
        begin
          sgENInspectionSheetItem.RowColor[i + 1] := clYellow;
          CellProperties[2, i+1].FontStyle := CellProperties[0, i+1].FontStyle + [fsBold];
        end else
        begin
          sgENInspectionSheetItem.RowColor[i + 1] := clWindow;
          CellProperties[2, i+1].FontStyle := CellProperties[0, i+1].FontStyle - [fsBold];
        end;


        Cells[1,i+1] := ENInspectionSheetItemList.list[i].defectCode;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
         CellProperties[1, i+1].FontStyle := CellProperties[1, i+1].FontStyle - [fsBold];

        Cells[2,i+1] := ENInspectionSheetItemList.list[i].defectName;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[2, i+1].FontStyle := CellProperties[2, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          if ENInspectionSheetItemList.list[i].isDetecting = YES then
            Cells[3,i+1] := 'виявлено'
          else
            Cells[3,i+1] := 'не виявлено';

        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[3, i+1].FontStyle := CellProperties[3, i+1].FontStyle - [fsBold];


        if ENInspectionSheetItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENInspectionSheetItemList.list[i].countGen.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[4, i+1].FontStyle := CellProperties[4, i+1].FontStyle - [fsBold];


        Cells[5,i+1] := ENInspectionSheetItemList.list[i].commentGen;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[5, i+1].FontStyle := CellProperties[5, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].countDefects = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENInspectionSheetItemList.list[i].countDefects.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[6, i+1].FontStyle := CellProperties[6, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].coefficientKi = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENInspectionSheetItemList.list[i].coefficientKi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[7, i+1].FontStyle := CellProperties[7, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].pointsPi = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENInspectionSheetItemList.list[i].pointsPi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[8, i+1].FontStyle := CellProperties[8, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].weightXi = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENInspectionSheetItemList.list[i].weightXi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[9, i+1].FontStyle := CellProperties[9, i+1].FontStyle - [fsBold];

        LastRow:=i+1;
        sgENInspectionSheetItem.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENInspectionSheetItem.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENInspectionSheetItem.RowCount > selectedRow then
      sgENInspectionSheetItem.Row := selectedRow
    else
      sgENInspectionSheetItem.Row := sgENInspectionSheetItem.RowCount - 1;
    end
    else
      sgENInspectionSheetItem.Row:=1;   
end;


procedure TfrmENInspectionSheetItemShow.sgENInspectionSheetItemTopLeftChanged(Sender: TObject);
var
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENInspectionSheetItemList: ENInspectionSheetItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENInspectionSheetItem.TopRow + sgENInspectionSheetItem.VisibleRowCount) = ColCount
  then
    begin
      TempENInspectionSheetItem :=  HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;
      CurrentRow:=sgENInspectionSheetItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENInspectionSheetItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInspectionSheetItemList := TempENInspectionSheetItem.getScrollableFilteredList(ENInspectionSheetItemFilter(FilterObject),ColCount-1, 100);


  sgENInspectionSheetItem.RowCount:=sgENInspectionSheetItem.RowCount+100;
  LastCount:=High(ENInspectionSheetItemList.list);
  with sgENInspectionSheetItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENInspectionSheetItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENInspectionSheetItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        if ENInspectionSheetItemList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENInspectionSheetItemList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';


        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode = Low(Integer) then
        begin
          sgENInspectionSheetItem.RowColor[i + 1] := clYellow;
          CellProperties[2, i+CurrentRow].FontStyle := CellProperties[0, i+CurrentRow].FontStyle + [fsBold];
        end else
        begin
          sgENInspectionSheetItem.RowColor[i + 1] := clWindow;
          CellProperties[2, i+CurrentRow].FontStyle := CellProperties[0, i+CurrentRow].FontStyle - [fsBold];
        end;


        Cells[1,i+CurrentRow] := ENInspectionSheetItemList.list[i].defectCode;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
         CellProperties[1, i+CurrentRow].FontStyle := CellProperties[1, i+CurrentRow].FontStyle - [fsBold];

        Cells[2,i+CurrentRow] := ENInspectionSheetItemList.list[i].defectName;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[2, i+CurrentRow].FontStyle := CellProperties[2, i+CurrentRow].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          if ENInspectionSheetItemList.list[i].isDetecting = YES then
            Cells[3,i+CurrentRow] := 'виявлено'
          else
            Cells[3,i+CurrentRow] := 'не виявлено';

        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[3, i+CurrentRow].FontStyle := CellProperties[3, i+CurrentRow].FontStyle - [fsBold];


        if ENInspectionSheetItemList.list[i].countGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENInspectionSheetItemList.list[i].countGen.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[4, i+CurrentRow].FontStyle := CellProperties[4, i+CurrentRow].FontStyle - [fsBold];


        Cells[5,i+CurrentRow] := ENInspectionSheetItemList.list[i].commentGen;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[5, i+CurrentRow].FontStyle := CellProperties[5, i+CurrentRow].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].countDefects = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENInspectionSheetItemList.list[i].countDefects.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[6, i+CurrentRow].FontStyle := CellProperties[6, i+CurrentRow].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].coefficientKi = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENInspectionSheetItemList.list[i].coefficientKi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[7, i+CurrentRow].FontStyle := CellProperties[7, i+CurrentRow].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].pointsPi = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENInspectionSheetItemList.list[i].pointsPi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[8, i+CurrentRow].FontStyle := CellProperties[8, i+CurrentRow].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].weightXi = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENInspectionSheetItemList.list[i].weightXi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[9, i+CurrentRow].FontStyle := CellProperties[9, i+CurrentRow].FontStyle - [fsBold];

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENInspectionSheetItem.Row:=CurrentRow-5;
   sgENInspectionSheetItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENInspectionSheetItemShow.sgENInspectionSheetItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENInspectionSheetItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENInspectionSheetItemShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENInspectionSheetItem.RowCount-1 do
   for j:=0 to sgENInspectionSheetItem.ColCount-1 do
     sgENInspectionSheetItem.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENInspectionSheetItemShow.actViewExecute(Sender: TObject);
var 
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
begin
  TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;
  try
    ENInspectionSheetItemObj := TempENInspectionSheetItem.getObject(StrToInt(sgENInspectionSheetItem.Cells[0, sgENInspectionSheetItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENInspectionSheetItemEdit := TfrmENInspectionSheetItemEdit.Create(Application, dsView);
  try
    frmENInspectionSheetItemEdit.ShowModal;
  finally
    frmENInspectionSheetItemEdit.Free;
    frmENInspectionSheetItemEdit := nil;
  end;
end;


procedure TfrmENInspectionSheetItemShow.actEditExecute(Sender: TObject);
var 
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
begin
  TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;
  try
    ENInspectionSheetItemObj := TempENInspectionSheetItem.getObject(StrToInt(sgENInspectionSheetItem.Cells[0,sgENInspectionSheetItem.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENInspectionSheetItem.Row;
  frmENInspectionSheetItemEdit:=TfrmENInspectionSheetItemEdit.Create(Application, dsEdit);
  
  try
    if frmENInspectionSheetItemEdit.ShowModal= mrOk then
      begin
        //TempENInspectionSheetItem.save(ENInspectionSheetItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENInspectionSheetItemEdit.Free;
    frmENInspectionSheetItemEdit:=nil;
  end;

  if sgENInspectionSheetItem.RowCount > selectedRow then
    sgENInspectionSheetItem.Row := selectedRow
  else
    sgENInspectionSheetItem.Row := sgENInspectionSheetItem.RowCount - 1;
  
end;


procedure TfrmENInspectionSheetItemShow.actDeleteExecute(Sender: TObject);
Var TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENInspectionSheetItem.Cells[0,sgENInspectionSheetItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Строки листа огляду об`єкта енергетики)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENInspectionSheetItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENInspectionSheetItemShow.actInsertExecute(Sender: TObject);
// Var TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort; 
begin
  // TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENInspectionSheetItemObj:=ENInspectionSheetItem.Create;
  SetNullIntProps(ENInspectionSheetItemObj);
  SetNullXSProps(ENInspectionSheetItemObj);

   //ENInspectionSheetItemObj.countGen:= TXSDecimal.Create;
   //ENInspectionSheetItemObj.countDefects:= TXSDecimal.Create;
   //ENInspectionSheetItemObj.coefficientKi:= TXSDecimal.Create;
   //ENInspectionSheetItemObj.pointsPi:= TXSDecimal.Create;
   //ENInspectionSheetItemObj.weightXi:= TXSDecimal.Create;
   //ENInspectionSheetItemObj.dateEdit:= TXSDate.Create;


  try
    frmENInspectionSheetItemEdit:=TfrmENInspectionSheetItemEdit.Create(Application, dsInsert);
    try
      if frmENInspectionSheetItemEdit.ShowModal = mrOk then
      begin
        if ENInspectionSheetItemObj<>nil then
            //TempENInspectionSheetItem.add(ENInspectionSheetItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENInspectionSheetItemEdit.Free;
      frmENInspectionSheetItemEdit:=nil;
    end;
  finally
    ENInspectionSheetItemObj.Free;
  end;
end;


procedure TfrmENInspectionSheetItemShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENInspectionSheetItemShow.actFilterExecute(Sender: TObject);
begin
{frmENInspectionSheetItemFilterEdit:=TfrmENInspectionSheetItemFilterEdit.Create(Application, dsInsert);
  try
    ENInspectionSheetItemFilterObj := ENInspectionSheetItemFilter.Create;
    SetNullIntProps(ENInspectionSheetItemFilterObj);
    SetNullXSProps(ENInspectionSheetItemFilterObj);

    if frmENInspectionSheetItemFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENInspectionSheetItemFilter.Create;
      FilterObject := ENInspectionSheetItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENInspectionSheetItemFilterEdit.Free;
    frmENInspectionSheetItemFilterEdit:=nil;
  end;}
end;


procedure TfrmENInspectionSheetItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;


end.
