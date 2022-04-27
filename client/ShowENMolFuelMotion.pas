
unit ShowENMolFuelMotion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMolFuelMotionController ;


type
  TfrmENMolFuelMotionShow = class(TChildForm)  
  HTTPRIOENMolFuelMotion: THTTPRIO;
    ImageList1: TImageList;
    sgENMolFuelMotion: TAdvStringGrid;
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
procedure sgENMolFuelMotionTopLeftChanged(Sender: TObject);
procedure sgENMolFuelMotionDblClick(Sender: TObject);
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
 // ENMolFuelMotionObj: ENMolFuelMotion;
 // ENMolFuelMotionFilterObj: ENMolFuelMotionFilter;
  
  
implementation

uses Main, EditENMolFuelMotion, EditENMolFuelMotionFilter;


{$R *.dfm}

var
  //frmENMolFuelMotionShow : TfrmENMolFuelMotionShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMolFuelMotionHeaders: array [1..9] of String =
        ( 'Код'
          ,'код МОЛа'
          ,'наименование МОЛа'
          ,'Дата'
          ,'Номенклатурний №'
          ,'Назва'
          ,'кількість'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENMolFuelMotionShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMolFuelMotionShow:=nil;
    inherited;
  end;


procedure TfrmENMolFuelMotionShow.FormShow(Sender: TObject);
var
  TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort;
  i: Integer;
  ENMolFuelMotionList: ENMolFuelMotionShortList;
  begin
  SetGridHeaders(ENMolFuelMotionHeaders, sgENMolFuelMotion.ColumnHeaders);
  ColCount:=100;
  TempENMolFuelMotion :=  HTTPRIOENMolFuelMotion as ENMolFuelMotionControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMolFuelMotionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolFuelMotionList := TempENMolFuelMotion.getScrollableFilteredList(ENMolFuelMotionFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMolFuelMotionList.list);

  if LastCount > -1 then
     sgENMolFuelMotion.RowCount:=LastCount+2
  else
     sgENMolFuelMotion.RowCount:=2;

   with sgENMolFuelMotion do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolFuelMotionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMolFuelMotionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMolFuelMotionList.list[i].molcode;
        Cells[2,i+1] := ENMolFuelMotionList.list[i].molname;
        if ENMolFuelMotionList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENMolFuelMotionList.list[i].dateGen);
        Cells[4,i+1] := ENMolFuelMotionList.list[i].nn;
        Cells[5,i+1] := ENMolFuelMotionList.list[i].mat_name;
        if ENMolFuelMotionList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENMolFuelMotionList.list[i].countGen.DecimalString;
        Cells[7,i+1] := ENMolFuelMotionList.list[i].userGen;
        if ENMolFuelMotionList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDateTimeWithDate2String(ENMolFuelMotionList.list[i].dateEdit);
        LastRow:=i+1;
        sgENMolFuelMotion.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMolFuelMotion.Row:=1;
end;

procedure TfrmENMolFuelMotionShow.sgENMolFuelMotionTopLeftChanged(Sender: TObject);
var
  TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort;
  i,CurrentRow: Integer;
  ENMolFuelMotionList: ENMolFuelMotionShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMolFuelMotion.TopRow + sgENMolFuelMotion.VisibleRowCount) = ColCount
  then
    begin
      TempENMolFuelMotion :=  HTTPRIOENMolFuelMotion as ENMolFuelMotionControllerSoapPort;
      CurrentRow:=sgENMolFuelMotion.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMolFuelMotionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolFuelMotionList := TempENMolFuelMotion.getScrollableFilteredList(ENMolFuelMotionFilter(FilterObject),ColCount-1, 100);



  sgENMolFuelMotion.RowCount:=sgENMolFuelMotion.RowCount+100;
  LastCount:=High(ENMolFuelMotionList.list);
  with sgENMolFuelMotion do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolFuelMotionList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMolFuelMotionList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMolFuelMotionList.list[i].molcode;
        Cells[2,i+CurrentRow] := ENMolFuelMotionList.list[i].molname;
        if ENMolFuelMotionList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENMolFuelMotionList.list[i].dateGen);
        Cells[4,i+CurrentRow] := ENMolFuelMotionList.list[i].nn;
        Cells[5,i+CurrentRow] := ENMolFuelMotionList.list[i].mat_name;
        if ENMolFuelMotionList.list[i].countGen = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENMolFuelMotionList.list[i].countGen.DecimalString;
        Cells[7,i+CurrentRow] := ENMolFuelMotionList.list[i].userGen;
        if ENMolFuelMotionList.list[i].dateEdit = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDateTimeWithDate2String(ENMolFuelMotionList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMolFuelMotion.Row:=CurrentRow-5;
   sgENMolFuelMotion.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMolFuelMotionShow.sgENMolFuelMotionDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMolFuelMotion,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMolFuelMotionShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMolFuelMotion.RowCount-1 do
   for j:=0 to sgENMolFuelMotion.ColCount-1 do
     sgENMolFuelMotion.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMolFuelMotionShow.actViewExecute(Sender: TObject);
Var TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort;
begin
 TempENMolFuelMotion := HTTPRIOENMolFuelMotion as ENMolFuelMotionControllerSoapPort;
   try
     ENMolFuelMotionObj := TempENMolFuelMotion.getObject(StrToInt(sgENMolFuelMotion.Cells[0,sgENMolFuelMotion.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolFuelMotionEdit:=TfrmENMolFuelMotionEdit.Create(Application, dsView);
  try
    frmENMolFuelMotionEdit.ShowModal;
  finally
    frmENMolFuelMotionEdit.Free;
    frmENMolFuelMotionEdit:=nil;
  end;
end;

procedure TfrmENMolFuelMotionShow.actEditExecute(Sender: TObject);
Var TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort;
begin
 TempENMolFuelMotion := HTTPRIOENMolFuelMotion as ENMolFuelMotionControllerSoapPort;
   try
     ENMolFuelMotionObj := TempENMolFuelMotion.getObject(StrToInt(sgENMolFuelMotion.Cells[0,sgENMolFuelMotion.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolFuelMotionEdit:=TfrmENMolFuelMotionEdit.Create(Application, dsEdit);
  try
    if frmENMolFuelMotionEdit.ShowModal= mrOk then
      begin
        //TempENMolFuelMotion.save(ENMolFuelMotionObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMolFuelMotionEdit.Free;
    frmENMolFuelMotionEdit:=nil;
  end;
end;

procedure TfrmENMolFuelMotionShow.actDeleteExecute(Sender: TObject);
Var TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMolFuelMotion := HTTPRIOENMolFuelMotion as ENMolFuelMotionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMolFuelMotion.Cells[0,sgENMolFuelMotion.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Движение топлива по МОЛам) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMolFuelMotion.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMolFuelMotionShow.actInsertExecute(Sender: TObject);
// Var TempENMolFuelMotion: ENMolFuelMotionControllerSoapPort; 
begin
  // TempENMolFuelMotion := HTTPRIOENMolFuelMotion as ENMolFuelMotionControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENMolFuelMotionObj:=ENMolFuelMotion.Create;

   //ENMolFuelMotionObj.dateGen:= TXSDate.Create;
   //ENMolFuelMotionObj.countGen:= TXSDecimal.Create;
   //ENMolFuelMotionObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENMolFuelMotionEdit:=TfrmENMolFuelMotionEdit.Create(Application, dsInsert);
    try
      if frmENMolFuelMotionEdit.ShowModal = mrOk then
      begin
        if ENMolFuelMotionObj<>nil then
            //TempENMolFuelMotion.add(ENMolFuelMotionObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMolFuelMotionEdit.Free;
      frmENMolFuelMotionEdit:=nil;
    end;
  finally
    ENMolFuelMotionObj.Free;
  end;
end;

procedure TfrmENMolFuelMotionShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMolFuelMotionShow.actFilterExecute(Sender: TObject);
begin
{frmENMolFuelMotionFilterEdit:=TfrmENMolFuelMotionFilterEdit.Create(Application, dsInsert);
  try
    ENMolFuelMotionFilterObj := ENMolFuelMotionFilter.Create;
    SetNullIntProps(ENMolFuelMotionFilterObj);
    SetNullXSProps(ENMolFuelMotionFilterObj);

    if frmENMolFuelMotionFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMolFuelMotionFilter.Create;
      FilterObject := ENMolFuelMotionFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMolFuelMotionFilterEdit.Free;
    frmENMolFuelMotionFilterEdit:=nil;
  end;}
end;

procedure TfrmENMolFuelMotionShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.