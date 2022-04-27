
unit ShowENArrester;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENArresterController, AdvObj ;


type
  TfrmENArresterShow = class(TChildForm)  
  HTTPRIOENArrester: THTTPRIO;
    ImageList1: TImageList;
    sgENArrester: TAdvStringGrid;
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
procedure sgENArresterTopLeftChanged(Sender: TObject);
procedure sgENArresterDblClick(Sender: TObject);
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
 frmENArresterShow : TfrmENArresterShow;
 // ENArresterObj: ENArrester;
 // ENArresterFilterObj: ENArresterFilter;
  
  
implementation

uses Main, EditENArrester, EditENArresterFilter;


{$R *.dfm}

var
  //frmENArresterShow : TfrmENArresterShow;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENArresterHeaders: array [1..6] of String =
        (  'Код'
         , 'Разрядник'
         , 'Диспетчерское название'
         , 'Место установки'
         , 'ТП 6 - 10 / 0,4 кВ'
         , '№ Високовольтної Ланки');

procedure TfrmENArresterShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENArresterShow:=nil;
    inherited;
  end;


procedure TfrmENArresterShow.FormShow(Sender: TObject);
var TempENArrester: ENArresterControllerSoapPort;
  i: Integer;
  ENArresterList: ENArresterShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENArresterHeaders, sgENArrester.ColumnHeaders);
  ColCount := 100;
  TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENArresterFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENArresterList := TempENArrester.getScrollableFilteredList(
    ENArresterFilter(FilterObject), 0, ColCount);

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
   ColCount := ColCount + 1;
   sgENArrester.Row := 1;
end;

procedure TfrmENArresterShow.sgENArresterTopLeftChanged(Sender: TObject);
var TempENArrester: ENArresterControllerSoapPort;
  i, CurrentRow: Integer;
  ENArresterList: ENArresterShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENArrester.TopRow + sgENArrester.VisibleRowCount) = ColCount then
    begin
      TempENArrester :=  HTTPRIOENArrester as ENArresterControllerSoapPort;
      CurrentRow:=sgENArrester.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENArresterFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENArresterList := TempENArrester.getScrollableFilteredList(
        ENArresterFilter(FilterObject), ColCount - 1, 100);

      sgENArrester.RowCount := sgENArrester.RowCount + 100;
      LastCount := High(ENArresterList.list);
      with sgENArrester do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENArresterList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENArresterList.list[i].code)
            else //Код Разрядника
              Cells[0, i + CurrentRow] := '';
            Cells[1, i + CurrentRow] := ENArresterList.list[i].materialRefName; //Разрядник из Нормативных материалов
            Cells[2, i + CurrentRow] := ENArresterList.list[i].name; //Диспетчерское название
            Cells[3, i + CurrentRow] := ENArresterList.list[i].arresterSiteName; //Место установки
            Cells[4, i + CurrentRow] := ENArresterList.list[i].substation04Name; //Трансформаторная Подстанция 6 - 10 / 0,4 кВ
            Cells[5, i + CurrentRow] := ENArresterList.list[i].highvoltageSellNumberGen; //№ Высоковольтной Ячейки
            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENArrester.Row := CurrentRow - 5;
       sgENArrester.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENArresterShow.sgENArresterDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENArrester,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENArresterShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENArrester.RowCount-1 do
   for j:=0 to sgENArrester.ColCount-1 do
     sgENArrester.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENArresterShow.actViewExecute(Sender: TObject);
Var TempENArrester: ENArresterControllerSoapPort;
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

procedure TfrmENArresterShow.actEditExecute(Sender: TObject);
Var TempENArrester: ENArresterControllerSoapPort;
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
        //TempENArrester.save(ENArresterObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENArresterEdit.Free;
    frmENArresterEdit:=nil;
  end;
end;

procedure TfrmENArresterShow.actDeleteExecute(Sender: TObject);
Var TempENArrester: ENArresterControllerSoapPort;
  ObjCode: Integer;
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
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENArresterShow.actInsertExecute(Sender: TObject);
Var TempENArrester: ENArresterControllerSoapPort;
begin
  TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;
  ENArresterObj:=ENArrester.Create;



  try
    frmENArresterEdit:=TfrmENArresterEdit.Create(Application, dsInsert);
    try
      if frmENArresterEdit.ShowModal = mrOk then
      begin
        if ENArresterObj<>nil then
            //TempENArrester.add(ENArresterObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENArresterEdit.Free;
      frmENArresterEdit:=nil;
    end;
  finally
    ENArresterObj.Free;
  end;
end;

procedure TfrmENArresterShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENArresterShow.actFilterExecute(Sender: TObject);
begin
{frmENArresterFilterEdit:=TfrmENArresterFilterEdit.Create(Application, dsInsert);
  try
    ENArresterFilterObj := ENArresterFilter.Create;
    SetNullIntProps(ENArresterFilterObj);
    SetNullXSProps(ENArresterFilterObj);

    if frmENArresterFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENArresterFilter.Create;
      FilterObject := ENArresterFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENArresterFilterEdit.Free;
    frmENArresterFilterEdit:=nil;
  end;}
end;

procedure TfrmENArresterShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.