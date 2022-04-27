
unit ShowEquipChangeWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  EquipChangeWorkerController, AdvObj ;


type
  TfrmEquipChangeWorkerShow = class(TChildForm)  
  HTTPRIOEquipChangeWorker: THTTPRIO;
    ImageList1: TImageList;
    sgEquipChangeWorker: TAdvStringGrid;
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
procedure sgEquipChangeWorkerTopLeftChanged(Sender: TObject);
procedure sgEquipChangeWorkerDblClick(Sender: TObject);
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
 frmEquipChangeWorkerShow : TfrmEquipChangeWorkerShow;
 // EquipChangeWorkerObj: EquipChangeWorker;
 // EquipChangeWorkerFilterObj: EquipChangeWorkerFilter;
  
  
implementation

uses Main, EditEquipChangeWorker, EditEquipChangeWorkerFilter;


{$R *.dfm}

var
  //frmEquipChangeWorkerShow : TfrmEquipChangeWorkerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  EquipChangeWorkerHeaders: array [1..2] of String =
        ( 'Код'
          ,'ФИО работника'
        );
   

procedure TfrmEquipChangeWorkerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmEquipChangeWorkerShow:=nil;
    inherited;
  end;


procedure TfrmEquipChangeWorkerShow.FormShow(Sender: TObject);
var
  TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
  i: Integer;
  EquipChangeWorkerList: EquipChangeWorkerShortList;
  begin
  SetGridHeaders(EquipChangeWorkerHeaders, sgEquipChangeWorker.ColumnHeaders);
  ColCount:=100;
  TempEquipChangeWorker :=  HTTPRIOEquipChangeWorker as EquipChangeWorkerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := EquipChangeWorkerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  EquipChangeWorkerList := TempEquipChangeWorker.getScrollableFilteredList(EquipChangeWorkerFilter(FilterObject),0,ColCount);


  LastCount:=High(EquipChangeWorkerList.list);

  if LastCount > -1 then
     sgEquipChangeWorker.RowCount:=LastCount+2
  else
     sgEquipChangeWorker.RowCount:=2;

   with sgEquipChangeWorker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if EquipChangeWorkerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(EquipChangeWorkerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := EquipChangeWorkerList.list[i].name;
        LastRow:=i+1;
        sgEquipChangeWorker.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgEquipChangeWorker.Row:=1;
end;

procedure TfrmEquipChangeWorkerShow.sgEquipChangeWorkerTopLeftChanged(Sender: TObject);
var
  TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
  i,CurrentRow: Integer;
  EquipChangeWorkerList: EquipChangeWorkerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgEquipChangeWorker.TopRow + sgEquipChangeWorker.VisibleRowCount) = ColCount
  then
    begin
      TempEquipChangeWorker :=  HTTPRIOEquipChangeWorker as EquipChangeWorkerControllerSoapPort;
      CurrentRow:=sgEquipChangeWorker.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := EquipChangeWorkerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  EquipChangeWorkerList := TempEquipChangeWorker.getScrollableFilteredList(EquipChangeWorkerFilter(FilterObject),ColCount-1, 100);



  sgEquipChangeWorker.RowCount:=sgEquipChangeWorker.RowCount+100;
  LastCount:=High(EquipChangeWorkerList.list);
  with sgEquipChangeWorker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if EquipChangeWorkerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(EquipChangeWorkerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := EquipChangeWorkerList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgEquipChangeWorker.Row:=CurrentRow-5;
   sgEquipChangeWorker.RowCount:=LastRow+1;
  end;
end;

procedure TfrmEquipChangeWorkerShow.sgEquipChangeWorkerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgEquipChangeWorker,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmEquipChangeWorkerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgEquipChangeWorker.RowCount-1 do
   for j:=0 to sgEquipChangeWorker.ColCount-1 do
     sgEquipChangeWorker.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmEquipChangeWorkerShow.actViewExecute(Sender: TObject);
Var TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
begin
 TempEquipChangeWorker := HTTPRIOEquipChangeWorker as EquipChangeWorkerControllerSoapPort;
   try
     EquipChangeWorkerObj := TempEquipChangeWorker.getObject(StrToInt(sgEquipChangeWorker.Cells[0,sgEquipChangeWorker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmEquipChangeWorkerEdit:=TfrmEquipChangeWorkerEdit.Create(Application, dsView);
  try
    frmEquipChangeWorkerEdit.ShowModal;
  finally
    frmEquipChangeWorkerEdit.Free;
    frmEquipChangeWorkerEdit:=nil;
  end;
end;

procedure TfrmEquipChangeWorkerShow.actEditExecute(Sender: TObject);
Var TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
begin
 TempEquipChangeWorker := HTTPRIOEquipChangeWorker as EquipChangeWorkerControllerSoapPort;
   try
     EquipChangeWorkerObj := TempEquipChangeWorker.getObject(StrToInt(sgEquipChangeWorker.Cells[0,sgEquipChangeWorker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmEquipChangeWorkerEdit:=TfrmEquipChangeWorkerEdit.Create(Application, dsEdit);
  try
    if frmEquipChangeWorkerEdit.ShowModal= mrOk then
      begin
        //TempEquipChangeWorker.save(EquipChangeWorkerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmEquipChangeWorkerEdit.Free;
    frmEquipChangeWorkerEdit:=nil;
  end;
end;

procedure TfrmEquipChangeWorkerShow.actDeleteExecute(Sender: TObject);
Var TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
  ObjCode: Integer;
begin
 TempEquipChangeWorker := HTTPRIOEquipChangeWorker as EquipChangeWorkerControllerSoapPort;
   try
     ObjCode := StrToInt(sgEquipChangeWorker.Cells[0,sgEquipChangeWorker.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Заменившие оборудование работники) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempEquipChangeWorker.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmEquipChangeWorkerShow.actInsertExecute(Sender: TObject);
Var TempEquipChangeWorker: EquipChangeWorkerControllerSoapPort;
begin
  TempEquipChangeWorker := HTTPRIOEquipChangeWorker as EquipChangeWorkerControllerSoapPort;
  EquipChangeWorkerObj:=EquipChangeWorker.Create;



  try
    frmEquipChangeWorkerEdit:=TfrmEquipChangeWorkerEdit.Create(Application, dsInsert);
    try
      if frmEquipChangeWorkerEdit.ShowModal = mrOk then
      begin
        if EquipChangeWorkerObj<>nil then
            //TempEquipChangeWorker.add(EquipChangeWorkerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmEquipChangeWorkerEdit.Free;
      frmEquipChangeWorkerEdit:=nil;
    end;
  finally
    EquipChangeWorkerObj.Free;
  end;
end;

procedure TfrmEquipChangeWorkerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmEquipChangeWorkerShow.actFilterExecute(Sender: TObject);
begin
{frmEquipChangeWorkerFilterEdit:=TfrmEquipChangeWorkerFilterEdit.Create(Application, dsInsert);
  try
    EquipChangeWorkerFilterObj := EquipChangeWorkerFilter.Create;
    SetNullIntProps(EquipChangeWorkerFilterObj);
    SetNullXSProps(EquipChangeWorkerFilterObj);

    if frmEquipChangeWorkerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := EquipChangeWorkerFilter.Create;
      FilterObject := EquipChangeWorkerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmEquipChangeWorkerFilterEdit.Free;
    frmEquipChangeWorkerFilterEdit:=nil;
  end;}
end;

procedure TfrmEquipChangeWorkerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.