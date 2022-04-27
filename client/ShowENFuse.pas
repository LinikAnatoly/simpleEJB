
unit ShowENFuse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuseController, AdvObj ;


type
  TfrmENFuseShow = class(TChildForm)  
  HTTPRIOENFuse: THTTPRIO;
    ImageList1: TImageList;
    sgENFuse: TAdvStringGrid;
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
procedure sgENFuseTopLeftChanged(Sender: TObject);
procedure sgENFuseDblClick(Sender: TObject);
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
 frmENFuseShow : TfrmENFuseShow;
 // ENFuseObj: ENFuse;
 // ENFuseFilterObj: ENFuseFilter;
  
  
implementation

uses Main, EditENFuse, EditENFuseFilter;


{$R *.dfm}

var
  //frmENFuseShow : TfrmENFuseShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuseHeaders: array [1..9] of String =
        ( 'Код'
        , 'Предохранитель'
        , 'Диспетчерское название'
        , 'Ток плавкой вставки, А'
        , 'ТП 6 - 10 / 0,4 кВ'
        , 'Високовольтна Ланка'
        , 'Панель'
        , 'Приєднання 0,4 кВ'
        , 'НВЩ'
       );


procedure TfrmENFuseShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuseShow:=nil;
    inherited;
  end;


procedure TfrmENFuseShow.FormShow(Sender: TObject);
var
  TempENFuse: ENFuseControllerSoapPort;
  i: Integer;
  ENFuseList: ENFuseShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENFuseHeaders, sgENFuse.ColumnHeaders);
  ColCount := 100;
  TempENFuse :=  HTTPRIOENFuse as ENFuseControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuseFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuseList := TempENFuse.getScrollableFilteredList(
    ENFuseFilter(FilterObject), 0, ColCount);


  LastCount := High(ENFuseList.list);

  if LastCount > -1 then
     sgENFuse.RowCount := LastCount + 2
  else
     sgENFuse.RowCount := 2;

  with sgENFuse do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuseList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENFuseList.list[i].code)
        else //Код Предохранителя
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENFuseList.list[i].materialRefName; //Предохранитель из Нормативных материалов
        Cells[2, i + 1] := ENFuseList.list[i].name; //Диспетчерское название
        if ENFuseList.list[i].currentFuse = nil then
          Cells[3, i + 1] := ''
        else //Ток плавкой вставки, А
          Cells[3, i + 1] := ENFuseList.list[i].currentFuse.DecimalString;
        Cells[4, i + 1] := ENFuseList.list[i].substation04Name; // Трансформаторна Підстанція 6 - 10 / 0,4 кВ
        Cells[5, i + 1] := ENFuseList.list[i].highVoltageSellNumberGen; //№ высоковольтной ячейки
        Cells[6, i + 1] := ENFuseList.list[i].panelName; //Номер панели
        Cells[7, i + 1] := ENFuseList.list[i].branchNumberGen + ' ' + ENFuseList.list[i].branchName; //Присоединение 0,4 кВ
        Cells[8, i + 1] := ENFuseList.list[i].lvbRefName; //или НВЩ
        //Закладка
        LastRow := i + 1;
        sgENFuse.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENFuse.Row:=1;
end;

procedure TfrmENFuseShow.sgENFuseTopLeftChanged(Sender: TObject);
var TempENFuse: ENFuseControllerSoapPort;
  i, CurrentRow: Integer;
  ENFuseList: ENFuseShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENFuse.TopRow + sgENFuse.VisibleRowCount) = ColCount then
    begin
      TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
      CurrentRow := sgENFuse.RowCount;

      if FilterObject = nil then
        begin
           FilterObject := ENFuseFilter.Create;
           SetNullIntProps(FilterObject);
           SetNullXSProps(FilterObject);
        end;

        ENFuseList := TempENFuse.getScrollableFilteredList(
          ENFuseFilter(FilterObject), ColCount - 1, 100);

        sgENFuse.RowCount:=sgENFuse.RowCount+100;
        LastCount:=High(ENFuseList.list);
        with sgENFuse do
          for i:=0 to LastCount do
            begin
              Application.ProcessMessages;
              if ENFuseList.list[i].code <> Low(Integer) then
                Cells[0, i + CurrentRow] := IntToStr(ENFuseList.list[i].code)
              else //Код Предохранителя
                Cells[0, i + CurrentRow] := '';
              Cells[1, i + CurrentRow] := ENFuseList.list[i].materialRefName; //Предохранитель из Нормативных материалов
              Cells[2, i + CurrentRow] := ENFuseList.list[i].name; //Диспетчерское название
              if ENFuseList.list[i].currentFuse = nil then
                Cells[3, i + CurrentRow] := ''
              else //Ток плавкой вставки, А
                Cells[3, i + CurrentRow] := ENFuseList.list[i].currentFuse.DecimalString;
              Cells[4, i + CurrentRow] := ENFuseList.list[i].substation04Name; // Трансформаторна Підстанція 6 - 10 / 0,4 кВ
              Cells[5, i + CurrentRow] := ENFuseList.list[i].highVoltageSellNumberGen; //№ высоковольтной ячейки
              Cells[6, i + CurrentRow] := ENFuseList.list[i].panelName; //Номер панели
              Cells[7, i + CurrentRow] := ENFuseList.list[i].branchNumberGen + ' ' + ENFuseList.list[i].branchName; //Присоединение 0,4 кВ
              Cells[8, i + CurrentRow] := ENFuseList.list[i].lvbRefName; //или НВЩ
              LastRow := i + CurrentRow;
            end;
          ColCount := ColCount + 100;
          sgENFuse.Row := CurrentRow - 5;
          sgENFuse.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENFuseShow.sgENFuseDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuse,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuseShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuse.RowCount-1 do
   for j:=0 to sgENFuse.ColCount-1 do
     sgENFuse.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuseShow.actViewExecute(Sender: TObject);
Var TempENFuse: ENFuseControllerSoapPort;
begin
 TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
   try
     ENFuseObj := TempENFuse.getObject(StrToInt(sgENFuse.Cells[0,sgENFuse.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuseEdit:=TfrmENFuseEdit.Create(Application, dsView);
  try
    frmENFuseEdit.ShowModal;
  finally
    frmENFuseEdit.Free;
    frmENFuseEdit:=nil;
  end;
end;

procedure TfrmENFuseShow.actEditExecute(Sender: TObject);
Var TempENFuse: ENFuseControllerSoapPort;
begin
 TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
   try
     ENFuseObj := TempENFuse.getObject(StrToInt(sgENFuse.Cells[0,sgENFuse.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuseEdit:=TfrmENFuseEdit.Create(Application, dsEdit);
  try
    if frmENFuseEdit.ShowModal= mrOk then
      begin
        //TempENFuse.save(ENFuseObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuseEdit.Free;
    frmENFuseEdit:=nil;
  end;
end;

procedure TfrmENFuseShow.actDeleteExecute(Sender: TObject);
Var TempENFuse: ENFuseControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuse.Cells[0,sgENFuse.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Предохранитель) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuse.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuseShow.actInsertExecute(Sender: TObject);
Var TempENFuse: ENFuseControllerSoapPort;
begin
  TempENFuse := HTTPRIOENFuse as ENFuseControllerSoapPort;
  ENFuseObj:=ENFuse.Create;

   //ENFuseObj.currentFuse:= TXSDecimal.Create;


  try
    frmENFuseEdit:=TfrmENFuseEdit.Create(Application, dsInsert);
    try
      if frmENFuseEdit.ShowModal = mrOk then
      begin
        if ENFuseObj<>nil then
            //TempENFuse.add(ENFuseObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuseEdit.Free;
      frmENFuseEdit:=nil;
    end;
  finally
    ENFuseObj.Free;
  end;
end;

procedure TfrmENFuseShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuseShow.actFilterExecute(Sender: TObject);
begin
{frmENFuseFilterEdit:=TfrmENFuseFilterEdit.Create(Application, dsInsert);
  try
    ENFuseFilterObj := ENFuseFilter.Create;
    SetNullIntProps(ENFuseFilterObj);
    SetNullXSProps(ENFuseFilterObj);

    if frmENFuseFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuseFilter.Create;
      FilterObject := ENFuseFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuseFilterEdit.Free;
    frmENFuseFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuseShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.