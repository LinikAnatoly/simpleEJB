
unit ShowENSubst150Discharger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150DischargerController ;


type
  TfrmENSubst150DischargerShow = class(TChildForm)  
  HTTPRIOENSubst150Discharger: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150Discharger: TAdvStringGrid;
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
procedure sgENSubst150DischargerTopLeftChanged(Sender: TObject);
procedure sgENSubst150DischargerDblClick(Sender: TObject);
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

//var
 // ENSubst150DischargerObj: ENSubst150Discharger;
 // ENSubst150DischargerFilterObj: ENSubst150DischargerFilter;
  
  
implementation

uses Main, EditENSubst150Discharger, EditENSubst150DischargerFilter;


{$R *.dfm}

var
  //frmENSubst150DischargerShow : TfrmENSubst150DischargerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150DischargerHeaders: array [1..5] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150DischargerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150DischargerShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150DischargerShow.FormShow(Sender: TObject);
var
  TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
  i: Integer;
  ENSubst150DischargerList: ENSubst150DischargerShortList;
  begin
  SetGridHeaders(ENSubst150DischargerHeaders, sgENSubst150Discharger.ColumnHeaders);
  ColCount:=100;
  TempENSubst150Discharger :=  HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150DischargerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150DischargerList := TempENSubst150Discharger.getScrollableFilteredList(ENSubst150DischargerFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150DischargerList.list);

  if LastCount > -1 then
     sgENSubst150Discharger.RowCount:=LastCount+2
  else
     sgENSubst150Discharger.RowCount:=2;

   with sgENSubst150Discharger do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150DischargerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150DischargerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150DischargerList.list[i].name;
        Cells[2,i+1] := ENSubst150DischargerList.list[i].factoryNumber;
        Cells[3,i+1] := ENSubst150DischargerList.list[i].commentGen;
        Cells[4,i+1] := ENSubst150DischargerList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150Discharger.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150Discharger.Row:=1;
end;

procedure TfrmENSubst150DischargerShow.sgENSubst150DischargerTopLeftChanged(Sender: TObject);
var
  TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150DischargerList: ENSubst150DischargerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150Discharger.TopRow + sgENSubst150Discharger.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150Discharger :=  HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
      CurrentRow:=sgENSubst150Discharger.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150DischargerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150DischargerList := TempENSubst150Discharger.getScrollableFilteredList(ENSubst150DischargerFilter(FilterObject),ColCount-1, 100);



  sgENSubst150Discharger.RowCount:=sgENSubst150Discharger.RowCount+100;
  LastCount:=High(ENSubst150DischargerList.list);
  with sgENSubst150Discharger do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150DischargerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150DischargerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150DischargerList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150DischargerList.list[i].factoryNumber;
        Cells[3,i+CurrentRow] := ENSubst150DischargerList.list[i].commentGen;
        Cells[4,i+CurrentRow] := ENSubst150DischargerList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150Discharger.Row:=CurrentRow-5;
   sgENSubst150Discharger.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150DischargerShow.sgENSubst150DischargerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150Discharger,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150DischargerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150Discharger.RowCount-1 do
   for j:=0 to sgENSubst150Discharger.ColCount-1 do
     sgENSubst150Discharger.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150DischargerShow.actViewExecute(Sender: TObject);
Var TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
begin
 TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
   try
     ENSubst150DischargerObj := TempENSubst150Discharger.getObject(StrToInt(sgENSubst150Discharger.Cells[0,sgENSubst150Discharger.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150DischargerEdit:=TfrmENSubst150DischargerEdit.Create(Application, dsView);
  try
    frmENSubst150DischargerEdit.ShowModal;
  finally
    frmENSubst150DischargerEdit.Free;
    frmENSubst150DischargerEdit:=nil;
  end;
end;

procedure TfrmENSubst150DischargerShow.actEditExecute(Sender: TObject);
Var TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
begin
 TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
   try
     ENSubst150DischargerObj := TempENSubst150Discharger.getObject(StrToInt(sgENSubst150Discharger.Cells[0,sgENSubst150Discharger.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150DischargerEdit:=TfrmENSubst150DischargerEdit.Create(Application, dsEdit);
  try
    if frmENSubst150DischargerEdit.ShowModal= mrOk then
      begin
        //TempENSubst150Discharger.save(ENSubst150DischargerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150DischargerEdit.Free;
    frmENSubst150DischargerEdit:=nil;
  end;
end;

procedure TfrmENSubst150DischargerShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150Discharger.Cells[0,sgENSubst150Discharger.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Разрядники (ОПН)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150Discharger.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150DischargerShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150Discharger: ENSubst150DischargerControllerSoapPort; 
begin
  // TempENSubst150Discharger := HTTPRIOENSubst150Discharger as ENSubst150DischargerControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150DischargerObj:=ENSubst150Discharger.Create;

   //ENSubst150DischargerObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150DischargerEdit:=TfrmENSubst150DischargerEdit.Create(Application, dsInsert);
    try
      if frmENSubst150DischargerEdit.ShowModal = mrOk then
      begin
        if ENSubst150DischargerObj<>nil then
            //TempENSubst150Discharger.add(ENSubst150DischargerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150DischargerEdit.Free;
      frmENSubst150DischargerEdit:=nil;
    end;
  finally
    ENSubst150DischargerObj.Free;
  end;
end;

procedure TfrmENSubst150DischargerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150DischargerShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150DischargerFilterEdit:=TfrmENSubst150DischargerFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150DischargerFilterObj := ENSubst150DischargerFilter.Create;
    SetNullIntProps(ENSubst150DischargerFilterObj);
    SetNullXSProps(ENSubst150DischargerFilterObj);

    if frmENSubst150DischargerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150DischargerFilter.Create;
      FilterObject := ENSubst150DischargerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150DischargerFilterEdit.Free;
    frmENSubst150DischargerFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150DischargerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.