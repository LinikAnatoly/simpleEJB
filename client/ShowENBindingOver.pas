
unit ShowENBindingOver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBindingOverController ;


type
  TfrmENBindingOverShow = class(TChildForm)  
  HTTPRIOENBindingOver: THTTPRIO;
    ImageList1: TImageList;
    sgENBindingOver: TAdvStringGrid;
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
procedure sgENBindingOverTopLeftChanged(Sender: TObject);
procedure sgENBindingOverDblClick(Sender: TObject);
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
 // ENBindingOverObj: ENBindingOver;
 // ENBindingOverFilterObj: ENBindingOverFilter;
  
  
implementation

uses Main, EditENBindingOver, EditENBindingOverFilter;


{$R *.dfm}

var
  //frmENBindingOverShow : TfrmENBindingOverShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBindingOverHeaders: array [1..6] of String =
        ( 'Код'
          ,'Номер припису'
          ,'Дата припису'
          ,'Пункт припису'
          ,'користувач змін'
          ,'дата ост. зміни'
        );
   

procedure TfrmENBindingOverShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBindingOverShow:=nil;
    inherited;
  end;


procedure TfrmENBindingOverShow.FormShow(Sender: TObject);
var
  TempENBindingOver: ENBindingOverControllerSoapPort;
  i: Integer;
  ENBindingOverList: ENBindingOverShortList;
  begin
  SetGridHeaders(ENBindingOverHeaders, sgENBindingOver.ColumnHeaders);
  ColCount:=100;
  TempENBindingOver :=  HTTPRIOENBindingOver as ENBindingOverControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBindingOverFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBindingOverList := TempENBindingOver.getScrollableFilteredList(ENBindingOverFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBindingOverList.list);

  if LastCount > -1 then
     sgENBindingOver.RowCount:=LastCount+2
  else
     sgENBindingOver.RowCount:=2;

   with sgENBindingOver do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBindingOverList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBindingOverList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBindingOverList.list[i].numberGen;
        if ENBindingOverList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENBindingOverList.list[i].dateGen);
        Cells[3,i+1] := ENBindingOverList.list[i].itemText;
        Cells[4,i+1] := ENBindingOverList.list[i].userGen;
        if ENBindingOverList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENBindingOverList.list[i].dateEdit);
        LastRow:=i+1;
        sgENBindingOver.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBindingOver.Row:=1;
end;

procedure TfrmENBindingOverShow.sgENBindingOverTopLeftChanged(Sender: TObject);
var
  TempENBindingOver: ENBindingOverControllerSoapPort;
  i,CurrentRow: Integer;
  ENBindingOverList: ENBindingOverShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBindingOver.TopRow + sgENBindingOver.VisibleRowCount) = ColCount
  then
    begin
      TempENBindingOver :=  HTTPRIOENBindingOver as ENBindingOverControllerSoapPort;
      CurrentRow:=sgENBindingOver.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBindingOverFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBindingOverList := TempENBindingOver.getScrollableFilteredList(ENBindingOverFilter(FilterObject),ColCount-1, 100);



  sgENBindingOver.RowCount:=sgENBindingOver.RowCount+100;
  LastCount:=High(ENBindingOverList.list);
  with sgENBindingOver do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBindingOverList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBindingOverList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBindingOverList.list[i].numberGen;
        if ENBindingOverList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENBindingOverList.list[i].dateGen);
        Cells[3,i+CurrentRow] := ENBindingOverList.list[i].itemText;
        Cells[4,i+CurrentRow] := ENBindingOverList.list[i].userGen;
        if ENBindingOverList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDate2String(ENBindingOverList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBindingOver.Row:=CurrentRow-5;
   sgENBindingOver.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBindingOverShow.sgENBindingOverDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBindingOver,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBindingOverShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBindingOver.RowCount-1 do
   for j:=0 to sgENBindingOver.ColCount-1 do
     sgENBindingOver.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBindingOverShow.actViewExecute(Sender: TObject);
Var TempENBindingOver: ENBindingOverControllerSoapPort;
begin
 TempENBindingOver := HTTPRIOENBindingOver as ENBindingOverControllerSoapPort;
   try
     ENBindingOverObj := TempENBindingOver.getObject(StrToInt(sgENBindingOver.Cells[0,sgENBindingOver.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBindingOverEdit:=TfrmENBindingOverEdit.Create(Application, dsView);
  try
    frmENBindingOverEdit.ShowModal;
  finally
    frmENBindingOverEdit.Free;
    frmENBindingOverEdit:=nil;
  end;
end;

procedure TfrmENBindingOverShow.actEditExecute(Sender: TObject);
Var TempENBindingOver: ENBindingOverControllerSoapPort;
begin
 TempENBindingOver := HTTPRIOENBindingOver as ENBindingOverControllerSoapPort;
   try
     ENBindingOverObj := TempENBindingOver.getObject(StrToInt(sgENBindingOver.Cells[0,sgENBindingOver.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBindingOverEdit:=TfrmENBindingOverEdit.Create(Application, dsEdit);
  try
    if frmENBindingOverEdit.ShowModal= mrOk then
      begin
        //TempENBindingOver.save(ENBindingOverObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBindingOverEdit.Free;
    frmENBindingOverEdit:=nil;
  end;
end;

procedure TfrmENBindingOverShow.actDeleteExecute(Sender: TObject);
Var TempENBindingOver: ENBindingOverControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBindingOver := HTTPRIOENBindingOver as ENBindingOverControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBindingOver.Cells[0,sgENBindingOver.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Приписи на планах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBindingOver.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBindingOverShow.actInsertExecute(Sender: TObject);
Var TempENBindingOver: ENBindingOverControllerSoapPort;
begin
  TempENBindingOver := HTTPRIOENBindingOver as ENBindingOverControllerSoapPort;
  ENBindingOverObj:=ENBindingOver.Create;

   ENBindingOverObj.dateGen:= TXSDate.Create;
   ENBindingOverObj.dateEdit:= TXSDate.Create;


  try
    frmENBindingOverEdit:=TfrmENBindingOverEdit.Create(Application, dsInsert);
    try
      if frmENBindingOverEdit.ShowModal = mrOk then
      begin
        if ENBindingOverObj<>nil then
            //TempENBindingOver.add(ENBindingOverObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBindingOverEdit.Free;
      frmENBindingOverEdit:=nil;
    end;
  finally
    ENBindingOverObj.Free;
  end;
end;

procedure TfrmENBindingOverShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBindingOverShow.actFilterExecute(Sender: TObject);
begin
{frmENBindingOverFilterEdit:=TfrmENBindingOverFilterEdit.Create(Application, dsEdit);
  try
    ENBindingOverFilterObj := ENBindingOverFilter.Create;
    SetNullIntProps(ENBindingOverFilterObj);
    SetNullXSProps(ENBindingOverFilterObj);

    if frmENBindingOverFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBindingOverFilter.Create;
      FilterObject := ENBindingOverFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBindingOverFilterEdit.Free;
    frmENBindingOverFilterEdit:=nil;
  end;}
end;

procedure TfrmENBindingOverShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.