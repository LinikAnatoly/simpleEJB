
unit ShowENSubst150ShortCircuiter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150ShortCircuiterController ;


type
  TfrmENSubst150ShortCircuiterShow = class(TChildForm)  
  HTTPRIOENSubst150ShortCircuiter: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150ShortCircuiter: TAdvStringGrid;
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
procedure sgENSubst150ShortCircuiterTopLeftChanged(Sender: TObject);
procedure sgENSubst150ShortCircuiterDblClick(Sender: TObject);
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
 // ENSubst150ShortCircuiterObj: ENSubst150ShortCircuiter;
 // ENSubst150ShortCircuiterFilterObj: ENSubst150ShortCircuiterFilter;
  
  
implementation

uses Main, EditENSubst150ShortCircuiter, EditENSubst150ShortCircuiterFilter;


{$R *.dfm}

var
  //frmENSubst150ShortCircuiterShow : TfrmENSubst150ShortCircuiterShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150ShortCircuiterHeaders: array [1..5] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150ShortCircuiterShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150ShortCircuiterShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150ShortCircuiterShow.FormShow(Sender: TObject);
var
  TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
  i: Integer;
  ENSubst150ShortCircuiterList: ENSubst150ShortCircuiterShortList;
  begin
  SetGridHeaders(ENSubst150ShortCircuiterHeaders, sgENSubst150ShortCircuiter.ColumnHeaders);
  ColCount:=100;
  TempENSubst150ShortCircuiter :=  HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150ShortCircuiterFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150ShortCircuiterList := TempENSubst150ShortCircuiter.getScrollableFilteredList(ENSubst150ShortCircuiterFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150ShortCircuiterList.list);

  if LastCount > -1 then
     sgENSubst150ShortCircuiter.RowCount:=LastCount+2
  else
     sgENSubst150ShortCircuiter.RowCount:=2;

   with sgENSubst150ShortCircuiter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150ShortCircuiterList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150ShortCircuiterList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150ShortCircuiterList.list[i].name;
        Cells[2,i+1] := ENSubst150ShortCircuiterList.list[i].factoryNumber;
        Cells[3,i+1] := ENSubst150ShortCircuiterList.list[i].commentGen;
        Cells[4,i+1] := ENSubst150ShortCircuiterList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150ShortCircuiter.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150ShortCircuiter.Row:=1;
end;

procedure TfrmENSubst150ShortCircuiterShow.sgENSubst150ShortCircuiterTopLeftChanged(Sender: TObject);
var
  TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150ShortCircuiterList: ENSubst150ShortCircuiterShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150ShortCircuiter.TopRow + sgENSubst150ShortCircuiter.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150ShortCircuiter :=  HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
      CurrentRow:=sgENSubst150ShortCircuiter.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150ShortCircuiterFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150ShortCircuiterList := TempENSubst150ShortCircuiter.getScrollableFilteredList(ENSubst150ShortCircuiterFilter(FilterObject),ColCount-1, 100);



  sgENSubst150ShortCircuiter.RowCount:=sgENSubst150ShortCircuiter.RowCount+100;
  LastCount:=High(ENSubst150ShortCircuiterList.list);
  with sgENSubst150ShortCircuiter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150ShortCircuiterList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150ShortCircuiterList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150ShortCircuiterList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150ShortCircuiterList.list[i].factoryNumber;
        Cells[3,i+CurrentRow] := ENSubst150ShortCircuiterList.list[i].commentGen;
        Cells[4,i+CurrentRow] := ENSubst150ShortCircuiterList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150ShortCircuiter.Row:=CurrentRow-5;
   sgENSubst150ShortCircuiter.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150ShortCircuiterShow.sgENSubst150ShortCircuiterDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150ShortCircuiter,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150ShortCircuiterShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150ShortCircuiter.RowCount-1 do
   for j:=0 to sgENSubst150ShortCircuiter.ColCount-1 do
     sgENSubst150ShortCircuiter.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150ShortCircuiterShow.actViewExecute(Sender: TObject);
Var TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
begin
 TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
   try
     ENSubst150ShortCircuiterObj := TempENSubst150ShortCircuiter.getObject(StrToInt(sgENSubst150ShortCircuiter.Cells[0,sgENSubst150ShortCircuiter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150ShortCircuiterEdit:=TfrmENSubst150ShortCircuiterEdit.Create(Application, dsView);
  try
    frmENSubst150ShortCircuiterEdit.ShowModal;
  finally
    frmENSubst150ShortCircuiterEdit.Free;
    frmENSubst150ShortCircuiterEdit:=nil;
  end;
end;

procedure TfrmENSubst150ShortCircuiterShow.actEditExecute(Sender: TObject);
Var TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
begin
 TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
   try
     ENSubst150ShortCircuiterObj := TempENSubst150ShortCircuiter.getObject(StrToInt(sgENSubst150ShortCircuiter.Cells[0,sgENSubst150ShortCircuiter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150ShortCircuiterEdit:=TfrmENSubst150ShortCircuiterEdit.Create(Application, dsEdit);
  try
    if frmENSubst150ShortCircuiterEdit.ShowModal= mrOk then
      begin
        //TempENSubst150ShortCircuiter.save(ENSubst150ShortCircuiterObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150ShortCircuiterEdit.Free;
    frmENSubst150ShortCircuiterEdit:=nil;
  end;
end;

procedure TfrmENSubst150ShortCircuiterShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150ShortCircuiter.Cells[0,sgENSubst150ShortCircuiter.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Короткозамыкатели) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150ShortCircuiter.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150ShortCircuiterShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150ShortCircuiter: ENSubst150ShortCircuiterControllerSoapPort; 
begin
  // TempENSubst150ShortCircuiter := HTTPRIOENSubst150ShortCircuiter as ENSubst150ShortCircuiterControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150ShortCircuiterObj:=ENSubst150ShortCircuiter.Create;

   //ENSubst150ShortCircuiterObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150ShortCircuiterEdit:=TfrmENSubst150ShortCircuiterEdit.Create(Application, dsInsert);
    try
      if frmENSubst150ShortCircuiterEdit.ShowModal = mrOk then
      begin
        if ENSubst150ShortCircuiterObj<>nil then
            //TempENSubst150ShortCircuiter.add(ENSubst150ShortCircuiterObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150ShortCircuiterEdit.Free;
      frmENSubst150ShortCircuiterEdit:=nil;
    end;
  finally
    ENSubst150ShortCircuiterObj.Free;
  end;
end;

procedure TfrmENSubst150ShortCircuiterShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150ShortCircuiterShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150ShortCircuiterFilterEdit:=TfrmENSubst150ShortCircuiterFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150ShortCircuiterFilterObj := ENSubst150ShortCircuiterFilter.Create;
    SetNullIntProps(ENSubst150ShortCircuiterFilterObj);
    SetNullXSProps(ENSubst150ShortCircuiterFilterObj);

    if frmENSubst150ShortCircuiterFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150ShortCircuiterFilter.Create;
      FilterObject := ENSubst150ShortCircuiterFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150ShortCircuiterFilterEdit.Free;
    frmENSubst150ShortCircuiterFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150ShortCircuiterShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.