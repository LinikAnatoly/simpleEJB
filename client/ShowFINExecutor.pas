
unit ShowFINExecutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINExecutorController, AdvObj ;


type
  TfrmFINExecutorShow = class(TChildForm)  
  HTTPRIOFINExecutor: THTTPRIO;
    ImageList1: TImageList;
    sgFINExecutor: TAdvStringGrid;
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
procedure sgFINExecutorTopLeftChanged(Sender: TObject);
procedure sgFINExecutorDblClick(Sender: TObject);
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
 frmFINExecutorShow : TfrmFINExecutorShow;
 // FINExecutorObj: FINExecutor;
 // FINExecutorFilterObj: FINExecutorFilter;
  
  
implementation

uses Main, EditFINExecutor, EditFINExecutorFilter;


{$R *.dfm}

var
  //frmFINExecutorShow : TfrmFINExecutorShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINExecutorHeaders: array [1..9] of String =
        ( 'Код'
          ,'Назва'
          ,'код підрозділа зі штатного роскладу'
          ,'Тип підрозділу'
          ,'код типу підрозділу'
          ,'Вид підрозділу'
          ,'код виду підрозділу'
          ,'ЦЕХ'
          ,'код ЦЕХУ'
        );
   

procedure TfrmFINExecutorShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINExecutorShow:=nil;
    inherited;
  end;


procedure TfrmFINExecutorShow.FormShow(Sender: TObject);
var
  TempFINExecutor: FINExecutorControllerSoapPort;
  i: Integer;
  FINExecutorList: FINExecutorShortList;
  begin
  SetGridHeaders(FINExecutorHeaders, sgFINExecutor.ColumnHeaders);
  ColCount:=100;
  TempFINExecutor :=  HTTPRIOFINExecutor as FINExecutorControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINExecutorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINExecutorList := TempFINExecutor.getScrollableFilteredList(FINExecutorFilter(FilterObject),0,ColCount);


  LastCount:=High(FINExecutorList.list);

  if LastCount > -1 then
     sgFINExecutor.RowCount:=LastCount+2
  else
     sgFINExecutor.RowCount:=2;

   with sgFINExecutor do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINExecutorList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINExecutorList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINExecutorList.list[i].name;
        if FINExecutorList.list[i].finCode = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(FINExecutorList.list[i].finCode);
        Cells[3,i+1] := FINExecutorList.list[i].finTypeName;
        if FINExecutorList.list[i].finTypeCode = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(FINExecutorList.list[i].finTypeCode);
        Cells[5,i+1] := FINExecutorList.list[i].finKindName;
        if FINExecutorList.list[i].finKindCode = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(FINExecutorList.list[i].finKindCode);
        Cells[7,i+1] := FINExecutorList.list[i].finCehName;
        if FINExecutorList.list[i].finCehCode = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINExecutorList.list[i].finCehCode);
        LastRow:=i+1;
        sgFINExecutor.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINExecutor.Row:=1;
end;

procedure TfrmFINExecutorShow.sgFINExecutorTopLeftChanged(Sender: TObject);
var
  TempFINExecutor: FINExecutorControllerSoapPort;
  i,CurrentRow: Integer;
  FINExecutorList: FINExecutorShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINExecutor.TopRow + sgFINExecutor.VisibleRowCount) = ColCount
  then
    begin
      TempFINExecutor :=  HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
      CurrentRow:=sgFINExecutor.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINExecutorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINExecutorList := TempFINExecutor.getScrollableFilteredList(FINExecutorFilter(FilterObject),ColCount-1, 100);



  sgFINExecutor.RowCount:=sgFINExecutor.RowCount+100;
  LastCount:=High(FINExecutorList.list);
  with sgFINExecutor do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINExecutorList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINExecutorList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINExecutorList.list[i].name;
        if FINExecutorList.list[i].finCode = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(FINExecutorList.list[i].finCode);
        Cells[3,i+CurrentRow] := FINExecutorList.list[i].finTypeName;
        if FINExecutorList.list[i].finTypeCode = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(FINExecutorList.list[i].finTypeCode);
        Cells[5,i+CurrentRow] := FINExecutorList.list[i].finKindName;
        if FINExecutorList.list[i].finKindCode = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(FINExecutorList.list[i].finKindCode);
        Cells[7,i+CurrentRow] := FINExecutorList.list[i].finCehName;
        if FINExecutorList.list[i].finCehCode = Low(Integer) then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := IntToStr(FINExecutorList.list[i].finCehCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINExecutor.Row:=CurrentRow-5;
   sgFINExecutor.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINExecutorShow.sgFINExecutorDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINExecutor,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINExecutorShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINExecutor.RowCount-1 do
   for j:=0 to sgFINExecutor.ColCount-1 do
     sgFINExecutor.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINExecutorShow.actViewExecute(Sender: TObject);
Var TempFINExecutor: FINExecutorControllerSoapPort;
begin
 TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
   try
     FINExecutorObj := TempFINExecutor.getObject(StrToInt(sgFINExecutor.Cells[0,sgFINExecutor.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINExecutorEdit:=TfrmFINExecutorEdit.Create(Application, dsView);
  try
    frmFINExecutorEdit.ShowModal;
  finally
    frmFINExecutorEdit.Free;
    frmFINExecutorEdit:=nil;
  end;
end;

procedure TfrmFINExecutorShow.actEditExecute(Sender: TObject);
Var TempFINExecutor: FINExecutorControllerSoapPort;
begin
 TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
   try
     FINExecutorObj := TempFINExecutor.getObject(StrToInt(sgFINExecutor.Cells[0,sgFINExecutor.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINExecutorEdit:=TfrmFINExecutorEdit.Create(Application, dsEdit);
  try
    if frmFINExecutorEdit.ShowModal= mrOk then
      begin
        //TempFINExecutor.save(FINExecutorObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINExecutorEdit.Free;
    frmFINExecutorEdit:=nil;
  end;
end;

procedure TfrmFINExecutorShow.actDeleteExecute(Sender: TObject);
Var TempFINExecutor: FINExecutorControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINExecutor.Cells[0,sgFINExecutor.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Виконавец робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINExecutor.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINExecutorShow.actInsertExecute(Sender: TObject);
Var TempFINExecutor: FINExecutorControllerSoapPort;
begin
  TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
  FINExecutorObj:=FINExecutor.Create;



  try
    frmFINExecutorEdit:=TfrmFINExecutorEdit.Create(Application, dsInsert);
    try
      if frmFINExecutorEdit.ShowModal = mrOk then
      begin
        if FINExecutorObj<>nil then
            //TempFINExecutor.add(FINExecutorObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINExecutorEdit.Free;
      frmFINExecutorEdit:=nil;
    end;
  finally
    FINExecutorObj.Free;
  end;
end;

procedure TfrmFINExecutorShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINExecutorShow.actFilterExecute(Sender: TObject);
begin
{frmFINExecutorFilterEdit:=TfrmFINExecutorFilterEdit.Create(Application, dsEdit);
  try
    FINExecutorFilterObj := FINExecutorFilter.Create;
    SetNullIntProps(FINExecutorFilterObj);
    SetNullXSProps(FINExecutorFilterObj);

    if frmFINExecutorFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINExecutorFilter.Create;
      FilterObject := FINExecutorFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINExecutorFilterEdit.Free;
    frmFINExecutorFilterEdit:=nil;
  end;}
end;

procedure TfrmFINExecutorShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.