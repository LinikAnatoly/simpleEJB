
unit ShowENWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWorkerController, AdvObj ;


type
  TfrmENWorkerShow = class(TChildForm)  
  HTTPRIOENWorker: THTTPRIO;
    ImageList1: TImageList;
    sgENWorker: TAdvStringGrid;
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
procedure sgENWorkerTopLeftChanged(Sender: TObject);
procedure sgENWorkerDblClick(Sender: TObject);
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
 frmENWorkerShow : TfrmENWorkerShow;
 // ENWorkerObj: ENWorker;
 // ENWorkerFilterObj: ENWorkerFilter;
  
  
implementation

uses Main, EditENWorker, EditENWorkerFilter;


{$R *.dfm}

var
  //frmENWorkerShow : TfrmENWorkerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWorkerHeaders: array [1..4] of String =
        ( 'Код'
          ,'ФІО робітника'
          ,'Табельний номер робітника'
          ,'признак МОЛу'
        );
   

procedure TfrmENWorkerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWorkerShow:=nil;
    inherited;
  end;


procedure TfrmENWorkerShow.FormShow(Sender: TObject);
var
  TempENWorker: ENWorkerControllerSoapPort;
  i: Integer;
  ENWorkerList: ENWorkerShortList;
  begin
  SetGridHeaders(ENWorkerHeaders, sgENWorker.ColumnHeaders);
  ColCount:=100;
  TempENWorker :=  HTTPRIOENWorker as ENWorkerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkerList := TempENWorker.getScrollableFilteredList(ENWorkerFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWorkerList.list);

  if LastCount > -1 then
     sgENWorker.RowCount:=LastCount+2
  else
     sgENWorker.RowCount:=2;

   with sgENWorker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWorkerList.list[i].name;
        Cells[2,i+1] := ENWorkerList.list[i].tabNumber;
        if ENWorkerList.list[i].isMol = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENWorkerList.list[i].isMol);
        LastRow:=i+1;
        sgENWorker.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWorker.Row:=1;
end;

procedure TfrmENWorkerShow.sgENWorkerTopLeftChanged(Sender: TObject);
var
  TempENWorker: ENWorkerControllerSoapPort;
  i,CurrentRow: Integer;
  ENWorkerList: ENWorkerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWorker.TopRow + sgENWorker.VisibleRowCount) = ColCount
  then
    begin
      TempENWorker :=  HTTPRIOENWorker as ENWorkerControllerSoapPort;
      CurrentRow:=sgENWorker.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkerList := TempENWorker.getScrollableFilteredList(ENWorkerFilter(FilterObject),ColCount-1, 100);



  sgENWorker.RowCount:=sgENWorker.RowCount+100;
  LastCount:=High(ENWorkerList.list);
  with sgENWorker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWorkerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWorkerList.list[i].name;
        Cells[2,i+CurrentRow] := ENWorkerList.list[i].tabNumber;
        if ENWorkerList.list[i].isMol = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENWorkerList.list[i].isMol);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWorker.Row:=CurrentRow-5;
   sgENWorker.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWorkerShow.sgENWorkerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWorker,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWorkerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWorker.RowCount-1 do
   for j:=0 to sgENWorker.ColCount-1 do
     sgENWorker.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWorkerShow.actViewExecute(Sender: TObject);
Var TempENWorker: ENWorkerControllerSoapPort;
begin
 TempENWorker := HTTPRIOENWorker as ENWorkerControllerSoapPort;
   try
     ENWorkerObj := TempENWorker.getObject(StrToInt(sgENWorker.Cells[0,sgENWorker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkerEdit:=TfrmENWorkerEdit.Create(Application, dsView);
  try
    frmENWorkerEdit.ShowModal;
  finally
    frmENWorkerEdit.Free;
    frmENWorkerEdit:=nil;
  end;
end;

procedure TfrmENWorkerShow.actEditExecute(Sender: TObject);
Var TempENWorker: ENWorkerControllerSoapPort;
begin
 TempENWorker := HTTPRIOENWorker as ENWorkerControllerSoapPort;
   try
     ENWorkerObj := TempENWorker.getObject(StrToInt(sgENWorker.Cells[0,sgENWorker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkerEdit:=TfrmENWorkerEdit.Create(Application, dsEdit);
  try
    if frmENWorkerEdit.ShowModal= mrOk then
      begin
        //TempENWorker.save(ENWorkerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWorkerEdit.Free;
    frmENWorkerEdit:=nil;
  end;
end;

procedure TfrmENWorkerShow.actDeleteExecute(Sender: TObject);
Var TempENWorker: ENWorkerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWorker := HTTPRIOENWorker as ENWorkerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWorker.Cells[0,sgENWorker.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Персонал) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWorker.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWorkerShow.actInsertExecute(Sender: TObject);
Var TempENWorker: ENWorkerControllerSoapPort;
begin
  TempENWorker := HTTPRIOENWorker as ENWorkerControllerSoapPort;
  ENWorkerObj:=ENWorker.Create;



  try
    frmENWorkerEdit:=TfrmENWorkerEdit.Create(Application, dsInsert);
    try
      if frmENWorkerEdit.ShowModal = mrOk then
      begin
        if ENWorkerObj<>nil then
            //TempENWorker.add(ENWorkerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWorkerEdit.Free;
      frmENWorkerEdit:=nil;
    end;
  finally
    ENWorkerObj.Free;
  end;
end;

procedure TfrmENWorkerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWorkerShow.actFilterExecute(Sender: TObject);
begin
{frmENWorkerFilterEdit:=TfrmENWorkerFilterEdit.Create(Application, dsEdit);
  try
    ENWorkerFilterObj := ENWorkerFilter.Create;
    SetNullIntProps(ENWorkerFilterObj);
    SetNullXSProps(ENWorkerFilterObj);

    if frmENWorkerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWorkerFilter.Create;
      FilterObject := ENWorkerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWorkerFilterEdit.Free;
    frmENWorkerFilterEdit:=nil;
  end;}
end;

procedure TfrmENWorkerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.