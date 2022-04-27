
unit ShowCNPack2PlanWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  CNPack2PlanWorkController ;


type
  TfrmCNPack2PlanWorkShow = class(TChildForm)  
  HTTPRIOCNPack2PlanWork: THTTPRIO;
    ImageList1: TImageList;
    sgCNPack2PlanWork: TAdvStringGrid;
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
procedure sgCNPack2PlanWorkTopLeftChanged(Sender: TObject);
procedure sgCNPack2PlanWorkDblClick(Sender: TObject);
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
 // CNPack2PlanWorkObj: CNPack2PlanWork;
 // CNPack2PlanWorkFilterObj: CNPack2PlanWorkFilter;
  
  
implementation

uses Main, EditCNPack2PlanWork, EditCNPack2PlanWorkFilter;


{$R *.dfm}

var
  //frmCNPack2PlanWorkShow : TfrmCNPack2PlanWorkShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  CNPack2PlanWorkHeaders: array [1..5] of String =
        ( 'Код'
          ,'код пакету'
          ,'Примітка'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmCNPack2PlanWorkShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmCNPack2PlanWorkShow:=nil;
    inherited;
  end;


procedure TfrmCNPack2PlanWorkShow.FormShow(Sender: TObject);
var
  TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
  i: Integer;
  CNPack2PlanWorkList: CNPack2PlanWorkShortList;
  begin
  SetGridHeaders(CNPack2PlanWorkHeaders, sgCNPack2PlanWork.ColumnHeaders);
  ColCount:=100;
  TempCNPack2PlanWork :=  HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := CNPack2PlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  CNPack2PlanWorkList := TempCNPack2PlanWork.getScrollableFilteredList(CNPack2PlanWorkFilter(FilterObject),0,ColCount);


  LastCount:=High(CNPack2PlanWorkList.list);

  if LastCount > -1 then
     sgCNPack2PlanWork.RowCount:=LastCount+2
  else
     sgCNPack2PlanWork.RowCount:=2;

   with sgCNPack2PlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if CNPack2PlanWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(CNPack2PlanWorkList.list[i].code)
        else
        Cells[0,i+1] := '';
        if CNPack2PlanWorkList.list[i].packCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(CNPack2PlanWorkList.list[i].packCode);
        Cells[2,i+1] := CNPack2PlanWorkList.list[i].commentGen;
        Cells[3,i+1] := CNPack2PlanWorkList.list[i].userGen;
        if CNPack2PlanWorkList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(CNPack2PlanWorkList.list[i].dateEdit);
        LastRow:=i+1;
        sgCNPack2PlanWork.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgCNPack2PlanWork.Row:=1;
end;

procedure TfrmCNPack2PlanWorkShow.sgCNPack2PlanWorkTopLeftChanged(Sender: TObject);
var
  TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
  i,CurrentRow: Integer;
  CNPack2PlanWorkList: CNPack2PlanWorkShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgCNPack2PlanWork.TopRow + sgCNPack2PlanWork.VisibleRowCount) = ColCount
  then
    begin
      TempCNPack2PlanWork :=  HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;
      CurrentRow:=sgCNPack2PlanWork.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := CNPack2PlanWorkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  CNPack2PlanWorkList := TempCNPack2PlanWork.getScrollableFilteredList(CNPack2PlanWorkFilter(FilterObject),ColCount-1, 100);



  sgCNPack2PlanWork.RowCount:=sgCNPack2PlanWork.RowCount+100;
  LastCount:=High(CNPack2PlanWorkList.list);
  with sgCNPack2PlanWork do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if CNPack2PlanWorkList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(CNPack2PlanWorkList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if CNPack2PlanWorkList.list[i].packCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(CNPack2PlanWorkList.list[i].packCode);
        Cells[2,i+CurrentRow] := CNPack2PlanWorkList.list[i].commentGen;
        Cells[3,i+CurrentRow] := CNPack2PlanWorkList.list[i].userGen;
        if CNPack2PlanWorkList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(CNPack2PlanWorkList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgCNPack2PlanWork.Row:=CurrentRow-5;
   sgCNPack2PlanWork.RowCount:=LastRow+1;
  end;
end;

procedure TfrmCNPack2PlanWorkShow.sgCNPack2PlanWorkDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgCNPack2PlanWork,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmCNPack2PlanWorkShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgCNPack2PlanWork.RowCount-1 do
   for j:=0 to sgCNPack2PlanWork.ColCount-1 do
     sgCNPack2PlanWork.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmCNPack2PlanWorkShow.actViewExecute(Sender: TObject);
Var TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
begin
 TempCNPack2PlanWork := HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;
   try
     CNPack2PlanWorkObj := TempCNPack2PlanWork.getObject(StrToInt(sgCNPack2PlanWork.Cells[0,sgCNPack2PlanWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmCNPack2PlanWorkEdit:=TfrmCNPack2PlanWorkEdit.Create(Application, dsView);
  try
    frmCNPack2PlanWorkEdit.ShowModal;
  finally
    frmCNPack2PlanWorkEdit.Free;
    frmCNPack2PlanWorkEdit:=nil;
  end;
end;

procedure TfrmCNPack2PlanWorkShow.actEditExecute(Sender: TObject);
Var TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
begin
 TempCNPack2PlanWork := HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;
   try
     CNPack2PlanWorkObj := TempCNPack2PlanWork.getObject(StrToInt(sgCNPack2PlanWork.Cells[0,sgCNPack2PlanWork.Row]));
   except
   on EConvertError do Exit;
  end;
  frmCNPack2PlanWorkEdit:=TfrmCNPack2PlanWorkEdit.Create(Application, dsEdit);
  try
    if frmCNPack2PlanWorkEdit.ShowModal= mrOk then
      begin
        //TempCNPack2PlanWork.save(CNPack2PlanWorkObj);
        UpdateGrid(Sender);
      end;
  finally
    frmCNPack2PlanWorkEdit.Free;
    frmCNPack2PlanWorkEdit:=nil;
  end;
end;

procedure TfrmCNPack2PlanWorkShow.actDeleteExecute(Sender: TObject);
Var TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
  ObjCode: Integer;
begin
 TempCNPack2PlanWork := HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;
   try
     ObjCode := StrToInt(sgCNPack2PlanWork.Cells[0,sgCNPack2PlanWork.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звязок плана (НПЗ) з пакетом в Приєднаннях) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempCNPack2PlanWork.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmCNPack2PlanWorkShow.actInsertExecute(Sender: TObject);
Var TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
begin
  TempCNPack2PlanWork := HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;
  CNPack2PlanWorkObj:=CNPack2PlanWork.Create;

   CNPack2PlanWorkObj.dateEdit:= TXSDate.Create;


  try
    frmCNPack2PlanWorkEdit:=TfrmCNPack2PlanWorkEdit.Create(Application, dsInsert);
    try
      if frmCNPack2PlanWorkEdit.ShowModal = mrOk then
      begin
        if CNPack2PlanWorkObj<>nil then
            //TempCNPack2PlanWork.add(CNPack2PlanWorkObj);
            UpdateGrid(Sender);
      end;
    finally
      frmCNPack2PlanWorkEdit.Free;
      frmCNPack2PlanWorkEdit:=nil;
    end;
  finally
    CNPack2PlanWorkObj.Free;
  end;
end;

procedure TfrmCNPack2PlanWorkShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmCNPack2PlanWorkShow.actFilterExecute(Sender: TObject);
begin
{frmCNPack2PlanWorkFilterEdit:=TfrmCNPack2PlanWorkFilterEdit.Create(Application, dsEdit);
  try
    CNPack2PlanWorkFilterObj := CNPack2PlanWorkFilter.Create;
    SetNullIntProps(CNPack2PlanWorkFilterObj);
    SetNullXSProps(CNPack2PlanWorkFilterObj);

    if frmCNPack2PlanWorkFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := CNPack2PlanWorkFilter.Create;
      FilterObject := CNPack2PlanWorkFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmCNPack2PlanWorkFilterEdit.Free;
    frmCNPack2PlanWorkFilterEdit:=nil;
  end;}
end;

procedure TfrmCNPack2PlanWorkShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.