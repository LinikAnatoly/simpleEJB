
unit ShowENObjCrossUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENObjCrossUpController, AdvObj ;


type
  TfrmENObjCrossUpShow = class(TChildForm)  
  HTTPRIOENObjCrossUp: THTTPRIO;
    ImageList1: TImageList;
    sgENObjCrossUp: TAdvStringGrid;
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
procedure sgENObjCrossUpTopLeftChanged(Sender: TObject);
procedure sgENObjCrossUpDblClick(Sender: TObject);
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
 frmENObjCrossUpShow : TfrmENObjCrossUpShow;
 // ENObjCrossUpObj: ENObjCrossUp;
 // ENObjCrossUpFilterObj: ENObjCrossUpFilter;
  
  
implementation

uses Main, EditENObjCrossUp, EditENObjCrossUpFilter;


{$R *.dfm}

var
  //frmENObjCrossUpShow : TfrmENObjCrossUpShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENObjCrossUpHeaders: array [1..2] of String =
        ( 'Код'
          ,'Об''єкт над ПЛ 6-10 кВ'
        );
   

procedure TfrmENObjCrossUpShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENObjCrossUpShow:=nil;
    inherited;
  end;


procedure TfrmENObjCrossUpShow.FormShow(Sender: TObject);
var
  TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
  i: Integer;
  ENObjCrossUpList: ENObjCrossUpShortList;
  begin
  SetGridHeaders(ENObjCrossUpHeaders, sgENObjCrossUp.ColumnHeaders);
  ColCount:=100;
  TempENObjCrossUp :=  HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENObjCrossUpFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENObjCrossUpList := TempENObjCrossUp.getScrollableFilteredList(ENObjCrossUpFilter(FilterObject),0,ColCount);


  LastCount:=High(ENObjCrossUpList.list);

  if LastCount > -1 then
     sgENObjCrossUp.RowCount:=LastCount+2
  else
     sgENObjCrossUp.RowCount:=2;

   with sgENObjCrossUp do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENObjCrossUpList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENObjCrossUpList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENObjCrossUpList.list[i].name;
        LastRow:=i+1;
        sgENObjCrossUp.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENObjCrossUp.Row:=1;
end;

procedure TfrmENObjCrossUpShow.sgENObjCrossUpTopLeftChanged(Sender: TObject);
var
  TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
  i,CurrentRow: Integer;
  ENObjCrossUpList: ENObjCrossUpShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENObjCrossUp.TopRow + sgENObjCrossUp.VisibleRowCount) = ColCount
  then
    begin
      TempENObjCrossUp :=  HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;
      CurrentRow:=sgENObjCrossUp.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENObjCrossUpFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENObjCrossUpList := TempENObjCrossUp.getScrollableFilteredList(ENObjCrossUpFilter(FilterObject),ColCount-1, 100);



  sgENObjCrossUp.RowCount:=sgENObjCrossUp.RowCount+100;
  LastCount:=High(ENObjCrossUpList.list);
  with sgENObjCrossUp do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENObjCrossUpList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENObjCrossUpList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENObjCrossUpList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENObjCrossUp.Row:=CurrentRow-5;
   sgENObjCrossUp.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENObjCrossUpShow.sgENObjCrossUpDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENObjCrossUp,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENObjCrossUpShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENObjCrossUp.RowCount-1 do
   for j:=0 to sgENObjCrossUp.ColCount-1 do
     sgENObjCrossUp.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENObjCrossUpShow.actViewExecute(Sender: TObject);
Var TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
begin
 TempENObjCrossUp := HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;
   try
     ENObjCrossUpObj := TempENObjCrossUp.getObject(StrToInt(sgENObjCrossUp.Cells[0,sgENObjCrossUp.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENObjCrossUpEdit:=TfrmENObjCrossUpEdit.Create(Application, dsView);
  try
    frmENObjCrossUpEdit.ShowModal;
  finally
    frmENObjCrossUpEdit.Free;
    frmENObjCrossUpEdit:=nil;
  end;
end;

procedure TfrmENObjCrossUpShow.actEditExecute(Sender: TObject);
Var TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
begin
 TempENObjCrossUp := HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;
   try
     ENObjCrossUpObj := TempENObjCrossUp.getObject(StrToInt(sgENObjCrossUp.Cells[0,sgENObjCrossUp.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENObjCrossUpEdit:=TfrmENObjCrossUpEdit.Create(Application, dsEdit);
  try
    if frmENObjCrossUpEdit.ShowModal= mrOk then
      begin
        //TempENObjCrossUp.save(ENObjCrossUpObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENObjCrossUpEdit.Free;
    frmENObjCrossUpEdit:=nil;
  end;
end;

procedure TfrmENObjCrossUpShow.actDeleteExecute(Sender: TObject);
Var TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
  ObjCode: Integer;
begin
 TempENObjCrossUp := HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;
   try
     ObjCode := StrToInt(sgENObjCrossUp.Cells[0,sgENObjCrossUp.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Об''єкти, які перетинають ПЛ 6-10 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENObjCrossUp.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENObjCrossUpShow.actInsertExecute(Sender: TObject);
// Var TempENObjCrossUp: ENObjCrossUpControllerSoapPort; 
begin
  // TempENObjCrossUp := HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENObjCrossUpObj:=ENObjCrossUp.Create;



  try
    frmENObjCrossUpEdit:=TfrmENObjCrossUpEdit.Create(Application, dsInsert);
    try
      if frmENObjCrossUpEdit.ShowModal = mrOk then
      begin
        if ENObjCrossUpObj<>nil then
            //TempENObjCrossUp.add(ENObjCrossUpObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENObjCrossUpEdit.Free;
      frmENObjCrossUpEdit:=nil;
    end;
  finally
    ENObjCrossUpObj.Free;
  end;
end;

procedure TfrmENObjCrossUpShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENObjCrossUpShow.actFilterExecute(Sender: TObject);
begin
{frmENObjCrossUpFilterEdit:=TfrmENObjCrossUpFilterEdit.Create(Application, dsInsert);
  try
    ENObjCrossUpFilterObj := ENObjCrossUpFilter.Create;
    SetNullIntProps(ENObjCrossUpFilterObj);
    SetNullXSProps(ENObjCrossUpFilterObj);

    if frmENObjCrossUpFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENObjCrossUpFilter.Create;
      FilterObject := ENObjCrossUpFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENObjCrossUpFilterEdit.Free;
    frmENObjCrossUpFilterEdit:=nil;
  end;}
end;

procedure TfrmENObjCrossUpShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.