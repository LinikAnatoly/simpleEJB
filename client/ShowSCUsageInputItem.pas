
unit ShowSCUsageInputItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCUsageInputItemController, AdvObj ;


type
  TfrmSCUsageInputItemShow = class(TChildForm)  
  HTTPRIOSCUsageInputItem: THTTPRIO;
    ImageList1: TImageList;
    sgSCUsageInputItem: TAdvStringGrid;
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
procedure sgSCUsageInputItemTopLeftChanged(Sender: TObject);
procedure sgSCUsageInputItemDblClick(Sender: TObject);
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
 frmSCUsageInputItemShow : TfrmSCUsageInputItemShow;
 // SCUsageInputItemObj: SCUsageInputItem;
 // SCUsageInputItemFilterObj: SCUsageInputItemFilter;
  
  
implementation

uses Main, EditSCUsageInputItem, EditSCUsageInputItemFilter;


{$R *.dfm}

var
  //frmSCUsageInputItemShow : TfrmSCUsageInputItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCUsageInputItemHeaders: array [1..4] of String =
        ( 'Код'
          ,'Номер документу'
          ,'кіль-сть'
          ,'код накладної з SC'
        );
   

procedure TfrmSCUsageInputItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCUsageInputItemShow:=nil;
    inherited;
  end;


procedure TfrmSCUsageInputItemShow.FormShow(Sender: TObject);
var
  TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
  i: Integer;
  SCUsageInputItemList: SCUsageInputItemShortList;
  begin
  SetGridHeaders(SCUsageInputItemHeaders, sgSCUsageInputItem.ColumnHeaders);
  ColCount:=100;
  TempSCUsageInputItem :=  HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemList := TempSCUsageInputItem.getScrollableFilteredList(SCUsageInputItemFilter(FilterObject),0,ColCount);


  LastCount:=High(SCUsageInputItemList.list);

  if LastCount > -1 then
     sgSCUsageInputItem.RowCount:=LastCount+2
  else
     sgSCUsageInputItem.RowCount:=2;

   with sgSCUsageInputItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCUsageInputItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCUsageInputItemList.list[i].numberDoc;
        if SCUsageInputItemList.list[i].countGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(SCUsageInputItemList.list[i].countGen);
        if SCUsageInputItemList.list[i].scCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(SCUsageInputItemList.list[i].scCode);
        LastRow:=i+1;
        sgSCUsageInputItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCUsageInputItem.Row:=1;
end;

procedure TfrmSCUsageInputItemShow.sgSCUsageInputItemTopLeftChanged(Sender: TObject);
var
  TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
  i,CurrentRow: Integer;
  SCUsageInputItemList: SCUsageInputItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCUsageInputItem.TopRow + sgSCUsageInputItem.VisibleRowCount) = ColCount
  then
    begin
      TempSCUsageInputItem :=  HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
      CurrentRow:=sgSCUsageInputItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCUsageInputItemList := TempSCUsageInputItem.getScrollableFilteredList(SCUsageInputItemFilter(FilterObject),ColCount-1, 100);



  sgSCUsageInputItem.RowCount:=sgSCUsageInputItem.RowCount+100;
  LastCount:=High(SCUsageInputItemList.list);
  with sgSCUsageInputItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCUsageInputItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCUsageInputItemList.list[i].numberDoc;
        if SCUsageInputItemList.list[i].countGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(SCUsageInputItemList.list[i].countGen);
        if SCUsageInputItemList.list[i].scCode = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(SCUsageInputItemList.list[i].scCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCUsageInputItem.Row:=CurrentRow-5;
   sgSCUsageInputItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCUsageInputItemShow.sgSCUsageInputItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCUsageInputItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCUsageInputItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCUsageInputItem.RowCount-1 do
   for j:=0 to sgSCUsageInputItem.ColCount-1 do
     sgSCUsageInputItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCUsageInputItemShow.actViewExecute(Sender: TObject);
Var TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
begin
 TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
   try
     SCUsageInputItemObj := TempSCUsageInputItem.getObject(StrToInt(sgSCUsageInputItem.Cells[0,sgSCUsageInputItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemEdit:=TfrmSCUsageInputItemEdit.Create(Application, dsView);
  try
    frmSCUsageInputItemEdit.ShowModal;
  finally
    frmSCUsageInputItemEdit.Free;
    frmSCUsageInputItemEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemShow.actEditExecute(Sender: TObject);
Var TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
begin
 TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
   try
     SCUsageInputItemObj := TempSCUsageInputItem.getObject(StrToInt(sgSCUsageInputItem.Cells[0,sgSCUsageInputItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCUsageInputItemEdit:=TfrmSCUsageInputItemEdit.Create(Application, dsEdit);
  try
    if frmSCUsageInputItemEdit.ShowModal= mrOk then
      begin
        //TempSCUsageInputItem.save(SCUsageInputItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCUsageInputItemEdit.Free;
    frmSCUsageInputItemEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputItemShow.actDeleteExecute(Sender: TObject);
Var TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCUsageInputItem.Cells[0,sgSCUsageInputItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Документ для вводу в експлуатацію Лічильників (накладна)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCUsageInputItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCUsageInputItemShow.actInsertExecute(Sender: TObject);
Var TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
begin
  TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
  SCUsageInputItemObj:=SCUsageInputItem.Create;



  try
    frmSCUsageInputItemEdit:=TfrmSCUsageInputItemEdit.Create(Application, dsInsert);
    try
      if frmSCUsageInputItemEdit.ShowModal = mrOk then
      begin
        if SCUsageInputItemObj<>nil then
            //TempSCUsageInputItem.add(SCUsageInputItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCUsageInputItemEdit.Free;
      frmSCUsageInputItemEdit:=nil;
    end;
  finally
    SCUsageInputItemObj.Free;
  end;
end;

procedure TfrmSCUsageInputItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCUsageInputItemShow.actFilterExecute(Sender: TObject);
begin
{frmSCUsageInputItemFilterEdit:=TfrmSCUsageInputItemFilterEdit.Create(Application, dsInsert);
  try
    SCUsageInputItemFilterObj := SCUsageInputItemFilter.Create;
    SetNullIntProps(SCUsageInputItemFilterObj);
    SetNullXSProps(SCUsageInputItemFilterObj);

    if frmSCUsageInputItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCUsageInputItemFilter.Create;
      FilterObject := SCUsageInputItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCUsageInputItemFilterEdit.Free;
    frmSCUsageInputItemFilterEdit:=nil;
  end;}
end;

procedure TfrmSCUsageInputItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.