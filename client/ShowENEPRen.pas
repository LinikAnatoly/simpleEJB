
unit ShowENEPRen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2, AdvObj
 // ,EPRenController
 ;


type
  TfrmENEPRenShow = class(TChildForm)  
  HTTPRIOENEPRen: THTTPRIO;
    ImageList1: TImageList;
    sgEPRen: TAdvStringGrid;
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
procedure sgEPRenTopLeftChanged(Sender: TObject);
procedure sgEPRenDblClick(Sender: TObject);
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
 frmENEPRenShow : TfrmENEPRenShow;
 // EPRenObj: EPRen;
 // EPRenFilterObj: EPRenFilter;
  
  
implementation

uses Main; //, EditEPRen, EditEPRenFilter;


{$R *.dfm}

var
  //frmEPRenShow : TfrmENEPRenShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  EPRenHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва підрозділу'
        );
   

procedure TfrmENEPRenShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEPRenShow:=nil;
    inherited;
  end;


procedure TfrmENEPRenShow.FormShow(Sender: TObject);
var
  TempEPRen: EPRenControllerSoapPort;
  i: Integer;
  EPRenList: EPRenShortList;
  begin

  DisableActions([actInsert, actEdit, actDelete]);

  SetGridHeaders(EPRenHeaders, sgEPRen.ColumnHeaders);
  ColCount:=100;
  TempEPRen :=  HTTPRIOENEPRen as EPRenControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := EPRenFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  EPRenList := TempEPRen.getScrollableFilteredList(EPRenFilter(FilterObject),0,ColCount);


  LastCount:=High(EPRenList.list);

  if LastCount > -1 then
     sgEPRen.RowCount:=LastCount+2
  else
     sgEPRen.RowCount:=2;

   with sgEPRen do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if EPRenList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(EPRenList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := EPRenList.list[i].name;
        LastRow:=i+1;
        sgEPRen.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgEPRen.Row:=1;
end;

procedure TfrmENEPRenShow.sgEPRenTopLeftChanged(Sender: TObject);
var
  TempEPRen: EPRenControllerSoapPort;
  i,CurrentRow: Integer;
  EPRenList: EPRenShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgEPRen.TopRow + sgEPRen.VisibleRowCount) = ColCount
  then
    begin
      TempEPRen :=  HTTPRIOENEPRen as EPRenControllerSoapPort;
      CurrentRow:=sgEPRen.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := EPRenFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  EPRenList := TempEPRen.getScrollableFilteredList(EPRenFilter(FilterObject),ColCount-1, 100);



  sgEPRen.RowCount:=sgEPRen.RowCount+100;
  LastCount:=High(EPRenList.list);
  with sgEPRen do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if EPRenList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(EPRenList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := EPRenList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgEPRen.Row:=CurrentRow-5;
   sgEPRen.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEPRenShow.sgEPRenDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgEPRen,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEPRenShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgEPRen.RowCount-1 do
   for j:=0 to sgEPRen.ColCount-1 do
     sgEPRen.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEPRenShow.actViewExecute(Sender: TObject);
Var TempEPRen: EPRenControllerSoapPort;
begin
{
 TempEPRen := HTTPRIOEPRen as EPRenControllerSoapPort;
   try
     EPRenObj := TempEPRen.getObject(StrToInt(sgEPRen.Cells[0,sgEPRen.Row]));
   except
   on EConvertError do Exit;
  end;
  frmEPRenEdit:=TfrmEPRenEdit.Create(Application, dsView);
  try
    frmEPRenEdit.ShowModal;
  finally
    frmEPRenEdit.Free;
    frmEPRenEdit:=nil;
  end;
  }
end;

procedure TfrmENEPRenShow.actEditExecute(Sender: TObject);
Var TempEPRen: EPRenControllerSoapPort;
begin
{
 TempEPRen := HTTPRIOEPRen as EPRenControllerSoapPort;
   try
     EPRenObj := TempEPRen.getObject(StrToInt(sgEPRen.Cells[0,sgEPRen.Row]));
   except
   on EConvertError do Exit;
  end;
  frmEPRenEdit:=TfrmEPRenEdit.Create(Application, dsEdit);
  try
    if frmEPRenEdit.ShowModal= mrOk then
      begin
        //TempEPRen.save(EPRenObj);
        UpdateGrid(Sender);
      end;
  finally
    frmEPRenEdit.Free;
    frmEPRenEdit:=nil;
  end;
  }
end;

procedure TfrmENEPRenShow.actDeleteExecute(Sender: TObject);
Var TempEPRen: EPRenControllerSoapPort;
  ObjCode: Integer;
begin
{
 TempEPRen := HTTPRIOEPRen as EPRenControllerSoapPort;
   try
     ObjCode := StrToInt(sgEPRen.Cells[0,sgEPRen.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Підрозділ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempEPRen.remove(ObjCode);
      UpdateGrid(Sender);
  end;
  }
end;

procedure TfrmENEPRenShow.actInsertExecute(Sender: TObject);
Var TempEPRen: EPRenControllerSoapPort;
begin
{
  TempEPRen := HTTPRIOEPRen as EPRenControllerSoapPort;
  EPRenObj:=EPRen.Create;



  try
    frmEPRenEdit:=TfrmEPRenEdit.Create(Application, dsInsert);
    try
      if frmEPRenEdit.ShowModal = mrOk then
      begin
        if EPRenObj<>nil then
            //TempEPRen.add(EPRenObj);
            UpdateGrid(Sender);
      end;
    finally
      frmEPRenEdit.Free;
      frmEPRenEdit:=nil;
    end;
  finally
    EPRenObj.Free;
  end;
  }
end;

procedure TfrmENEPRenShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEPRenShow.actFilterExecute(Sender: TObject);
begin
{frmEPRenFilterEdit:=TfrmEPRenFilterEdit.Create(Application, dsEdit);
  try
    if frmEPRenFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := EPRenFilter.Create;
      FilterObject := EPRenFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmEPRenFilterEdit.Free;
    frmEPRenFilterEdit:=nil;
  end;}
end;

procedure TfrmENEPRenShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.