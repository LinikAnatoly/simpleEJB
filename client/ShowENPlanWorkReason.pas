
unit ShowENPlanWorkReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkReasonController, AdvObj ;


type
  TfrmENPlanWorkReasonShow = class(TChildForm)  
  HTTPRIOENPlanWorkReason: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkReason: TAdvStringGrid;
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
procedure sgENPlanWorkReasonTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkReasonDblClick(Sender: TObject);
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
 frmENPlanWorkReasonShow : TfrmENPlanWorkReasonShow;
 // ENPlanWorkReasonObj: ENPlanWorkReason;
 // ENPlanWorkReasonFilterObj: ENPlanWorkReasonFilter;
  
  
implementation

uses Main, EditENPlanWorkReason, EditENPlanWorkReasonFilter;


{$R *.dfm}

var
  //frmENPlanWorkReasonShow : TfrmENPlanWorkReasonShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkReasonHeaders: array [1..8] of String =
        ( 'Код'
          ,'Дата розпорядження'
          ,'Номер розпорядження'
          ,'Назва'
          ,'Тип'
          ,'Дирекція'
          ,'Дата зміни'
          ,'користувач'
        );
   

procedure TfrmENPlanWorkReasonShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkReasonShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkReasonShow.FormShow(Sender: TObject);
var
  TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
  i: Integer;
  ENPlanWorkReasonList: ENPlanWorkReasonShortList;
  begin
  SetGridHeaders(ENPlanWorkReasonHeaders, sgENPlanWorkReason.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkReason :=  HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkReasonList := TempENPlanWorkReason.getScrollableFilteredList(ENPlanWorkReasonFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkReasonList.list);

  if LastCount > -1 then
     sgENPlanWorkReason.RowCount:=LastCount+2
  else
     sgENPlanWorkReason.RowCount:=2;

   with sgENPlanWorkReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkReasonList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanWorkReasonList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPlanWorkReasonList.list[i].dateGen);
        Cells[2,i+1] := ENPlanWorkReasonList.list[i].numberGen;
        Cells[3,i+1] := ENPlanWorkReasonList.list[i].name;

        Cells[4, i+1] := ENPlanWorkReasonList.list[i].reasonTypeName;
        Cells[5, i+1] := ENPlanWorkReasonList.list[i].managementName;

        if ENPlanWorkReasonList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENPlanWorkReasonList.list[i].dateEdit);
        Cells[7,i+1] := ENPlanWorkReasonList.list[i].userGen;
        LastRow:=i+1;
        sgENPlanWorkReason.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkReason.Row:=1;
end;

procedure TfrmENPlanWorkReasonShow.sgENPlanWorkReasonTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkReasonList: ENPlanWorkReasonShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkReason.TopRow + sgENPlanWorkReason.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkReason :=  HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;
      CurrentRow:=sgENPlanWorkReason.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkReasonList := TempENPlanWorkReason.getScrollableFilteredList(ENPlanWorkReasonFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkReason.RowCount:=sgENPlanWorkReason.RowCount+100;
  LastCount:=High(ENPlanWorkReasonList.list);
  with sgENPlanWorkReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkReasonList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPlanWorkReasonList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENPlanWorkReasonList.list[i].dateGen);
        Cells[2,i+CurrentRow] := ENPlanWorkReasonList.list[i].numberGen;
        Cells[3,i+CurrentRow] := ENPlanWorkReasonList.list[i].name;

        Cells[4, i+CurrentRow] := ENPlanWorkReasonList.list[i].reasonTypeName;
        Cells[5, i+CurrentRow] := ENPlanWorkReasonList.list[i].managementName;

        if ENPlanWorkReasonList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanWorkReasonList.list[i].dateEdit);
        Cells[7,i+CurrentRow] := ENPlanWorkReasonList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkReason.Row:=CurrentRow-5;
   sgENPlanWorkReason.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkReasonShow.sgENPlanWorkReasonDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkReason,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkReasonShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkReason.RowCount-1 do
   for j:=0 to sgENPlanWorkReason.ColCount-1 do
     sgENPlanWorkReason.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkReasonShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
begin
 TempENPlanWorkReason := HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;
   try
     ENPlanWorkReasonObj := TempENPlanWorkReason.getObject(StrToInt(sgENPlanWorkReason.Cells[0,sgENPlanWorkReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkReasonEdit:=TfrmENPlanWorkReasonEdit.Create(Application, dsView);
  try
    frmENPlanWorkReasonEdit.ShowModal;
  finally
    frmENPlanWorkReasonEdit.Free;
    frmENPlanWorkReasonEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkReasonShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
begin
 TempENPlanWorkReason := HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;
   try
     ENPlanWorkReasonObj := TempENPlanWorkReason.getObject(StrToInt(sgENPlanWorkReason.Cells[0,sgENPlanWorkReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkReasonEdit:=TfrmENPlanWorkReasonEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkReasonEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkReason.save(ENPlanWorkReasonObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkReasonEdit.Free;
    frmENPlanWorkReasonEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkReasonShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkReason := HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkReason.Cells[0,sgENPlanWorkReason.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Підстава для позапланових Планів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkReason.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkReasonShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
begin
  TempENPlanWorkReason := HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;
  ENPlanWorkReasonObj:=ENPlanWorkReason.Create;

   //ENPlanWorkReasonObj.dateGen:= TXSDate.Create;
   //ENPlanWorkReasonObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENPlanWorkReasonEdit:=TfrmENPlanWorkReasonEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkReasonEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkReasonObj<>nil then
            //TempENPlanWorkReason.add(ENPlanWorkReasonObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkReasonEdit.Free;
      frmENPlanWorkReasonEdit:=nil;
    end;
  finally
    ENPlanWorkReasonObj.Free;
  end;
end;

procedure TfrmENPlanWorkReasonShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkReasonShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkReasonFilterEdit:=TfrmENPlanWorkReasonFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkReasonFilterObj := ENPlanWorkReasonFilter.Create;
    SetNullIntProps(ENPlanWorkReasonFilterObj);
    SetNullXSProps(ENPlanWorkReasonFilterObj);

    if frmENPlanWorkReasonFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWorkReasonFilter.Create;
      FilterObject := ENPlanWorkReasonFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkReasonFilterEdit.Free;
    frmENPlanWorkReasonFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkReasonShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.