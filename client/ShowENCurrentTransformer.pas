
unit ShowENCurrentTransformer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCurrentTransformerController, AdvObj ;


type
  TfrmENCurrentTransformerShow = class(TChildForm)  
  HTTPRIOENCurrentTransformer: THTTPRIO;
    ImageList1: TImageList;
    sgENCurrentTransformer: TAdvStringGrid;
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

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENCurrentTransformerTopLeftChanged(Sender: TObject);
procedure sgENCurrentTransformerDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENCurrentTransformerShow : TfrmENCurrentTransformerShow;
 // ENCurrentTransformerObj: ENCurrentTransformer;
 // ENCurrentTransformerFilterObj: ENCurrentTransformerFilter;
  
  
implementation

uses Main, EditENCurrentTransformer, EditENCurrentTransformerFilter;


{$R *.dfm}

var
  //frmENCurrentTransformerShow : TfrmENCurrentTransformerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCurrentTransformerHeaders: array [1..6] of String =
        ( 'Код'
          ,'Трансформатор тока'
          ,'Диспетчетское название'
          ,'Класс точности'
          ,'Коэф. трансформации'
          ,'Кол-во вторичных обмоток, шт.'
          //,'Количество трансформаторов тока, шт.'
        );
   

procedure TfrmENCurrentTransformerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCurrentTransformerShow:=nil;
    inherited;
  end;


procedure TfrmENCurrentTransformerShow.FormShow(Sender: TObject);
var
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  i: Integer;
  ENCurrentTransformerList: ENCurrentTransformerShortList;
begin
  SetGridHeaders(
    ENCurrentTransformerHeaders, sgENCurrentTransformer.ColumnHeaders);
  ColCount := 100;
  TempENCurrentTransformer :=
    HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCurrentTransformerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCurrentTransformerList := TempENCurrentTransformer.getScrollableFilteredList(
    ENCurrentTransformerFilter(FilterObject), 0, ColCount);


  LastCount:=High(ENCurrentTransformerList.list);

  if LastCount > -1 then
     sgENCurrentTransformer.RowCount := LastCount + 2
  else
     sgENCurrentTransformer.RowCount := 2;

  with sgENCurrentTransformer do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENCurrentTransformerList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENCurrentTransformerList.list[i].code)
        else //Код Трансформатора тока
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENCurrentTransformerList.list[i].materialRefName; //Трансформатор тока из Нормативных материалов
        Cells[2, i + 1] := ENCurrentTransformerList.list[i].name; //Диспетчетское название Трансформатора тока
        if ENCurrentTransformerList.list[i].accruracyClass = nil then
          Cells[3, i + 1] := ''
        else //Класс точности
          Cells[3, i + 1] :=
            ENCurrentTransformerList.list[i].accruracyClass.DecimalString;
        if ENCurrentTransformerList.list[i].coefTransformation = nil then
          Cells[4, i + 1] := ''
        else //Коэффициент трансформации
          Cells[4, i + 1] :=
            ENCurrentTransformerList.list[i].coefTransformation.DecimalString;
        if ENCurrentTransformerList.list[i].secondaryWindingsNumber = nil then
          Cells[5, i + 1] := ''
        else //Количество вторичных обмоток, шт.
          Cells[5, i + 1] :=
            ENCurrentTransformerList.list[i].secondaryWindingsNumber.DecimalString;
        (*if ENCurrentTransformerList.list[i].numberGen = nil then
          Cells[6, i + 1] := ''
        else //Количество трансформаторов тока
          Cells[6, i + 1] :=
            ENCurrentTransformerList.list[i].numberGen.DecimalString;*)
        LastRow := i + 1;
        sgENCurrentTransformer.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENCurrentTransformer.Row := 1;
end;

procedure TfrmENCurrentTransformerShow.sgENCurrentTransformerTopLeftChanged(Sender: TObject);
var
  TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  i,CurrentRow: Integer;
  ENCurrentTransformerList: ENCurrentTransformerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCurrentTransformer.TopRow + sgENCurrentTransformer.VisibleRowCount) = ColCount
  then
    begin
      TempENCurrentTransformer :=  HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
      CurrentRow:=sgENCurrentTransformer.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCurrentTransformerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCurrentTransformerList := TempENCurrentTransformer.getScrollableFilteredList(ENCurrentTransformerFilter(FilterObject),ColCount-1, 100);



  sgENCurrentTransformer.RowCount:=sgENCurrentTransformer.RowCount+100;
  LastCount:=High(ENCurrentTransformerList.list);
  with sgENCurrentTransformer do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCurrentTransformerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCurrentTransformerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENCurrentTransformerList.list[i].accruracyClass = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENCurrentTransformerList.list[i].accruracyClass.DecimalString;
        if ENCurrentTransformerList.list[i].numberGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENCurrentTransformerList.list[i].numberGen.DecimalString;
        if ENCurrentTransformerList.list[i].coefTransformation = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENCurrentTransformerList.list[i].coefTransformation.DecimalString;
        if ENCurrentTransformerList.list[i].secondaryWindingsNumber = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENCurrentTransformerList.list[i].secondaryWindingsNumber.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCurrentTransformer.Row:=CurrentRow-5;
   sgENCurrentTransformer.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCurrentTransformerShow.sgENCurrentTransformerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCurrentTransformer,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCurrentTransformerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCurrentTransformer.RowCount-1 do
   for j:=0 to sgENCurrentTransformer.ColCount-1 do
     sgENCurrentTransformer.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCurrentTransformerShow.actViewExecute(Sender: TObject);
Var TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
begin
 TempENCurrentTransformer := HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
   try
     ENCurrentTransformerObj := TempENCurrentTransformer.getObject(StrToInt(sgENCurrentTransformer.Cells[0,sgENCurrentTransformer.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCurrentTransformerEdit:=TfrmENCurrentTransformerEdit.Create(Application, dsView);
  try
    frmENCurrentTransformerEdit.ShowModal;
  finally
    frmENCurrentTransformerEdit.Free;
    frmENCurrentTransformerEdit:=nil;
  end;
end;

procedure TfrmENCurrentTransformerShow.actEditExecute(Sender: TObject);
Var TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
begin
 TempENCurrentTransformer := HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
   try
     ENCurrentTransformerObj := TempENCurrentTransformer.getObject(StrToInt(sgENCurrentTransformer.Cells[0,sgENCurrentTransformer.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCurrentTransformerEdit:=TfrmENCurrentTransformerEdit.Create(Application, dsEdit);
  try
    if frmENCurrentTransformerEdit.ShowModal= mrOk then
      begin
        //TempENCurrentTransformer.save(ENCurrentTransformerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCurrentTransformerEdit.Free;
    frmENCurrentTransformerEdit:=nil;
  end;
end;

procedure TfrmENCurrentTransformerShow.actDeleteExecute(Sender: TObject);
Var TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCurrentTransformer := HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCurrentTransformer.Cells[0,sgENCurrentTransformer.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Трансформатор тока) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCurrentTransformer.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCurrentTransformerShow.actInsertExecute(Sender: TObject);
Var TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
begin
  TempENCurrentTransformer := HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
  ENCurrentTransformerObj:=ENCurrentTransformer.Create;

   //ENCurrentTransformerObj.accruracyClass:= TXSDecimal.Create;
   //ENCurrentTransformerObj.numberGen:= TXSDecimal.Create;
   //ENCurrentTransformerObj.coefTransformation:= TXSDecimal.Create;
   //ENCurrentTransformerObj.secondaryWindingsNumber:= TXSDecimal.Create;


  try
    frmENCurrentTransformerEdit:=TfrmENCurrentTransformerEdit.Create(Application, dsInsert);
    try
      if frmENCurrentTransformerEdit.ShowModal = mrOk then
      begin
        if ENCurrentTransformerObj<>nil then
            //TempENCurrentTransformer.add(ENCurrentTransformerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCurrentTransformerEdit.Free;
      frmENCurrentTransformerEdit:=nil;
    end;
  finally
    ENCurrentTransformerObj.Free;
  end;
end;

procedure TfrmENCurrentTransformerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCurrentTransformerShow.actFilterExecute(Sender: TObject);
begin
{frmENCurrentTransformerFilterEdit:=TfrmENCurrentTransformerFilterEdit.Create(Application, dsInsert);
  try
    ENCurrentTransformerFilterObj := ENCurrentTransformerFilter.Create;
    SetNullIntProps(ENCurrentTransformerFilterObj);
    SetNullXSProps(ENCurrentTransformerFilterObj);

    if frmENCurrentTransformerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCurrentTransformerFilter.Create;
      FilterObject := ENCurrentTransformerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCurrentTransformerFilterEdit.Free;
    frmENCurrentTransformerFilterEdit:=nil;
  end;}
end;

procedure TfrmENCurrentTransformerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.