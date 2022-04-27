
unit ShowRQStorage2ENMol2Zone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQStorage2ENMol2ZoneController ;


type
  TfrmRQStorage2ENMol2ZoneShow = class(TChildForm)  
  HTTPRIORQStorage2ENMol2Zone: THTTPRIO;
    ImageList1: TImageList;
    sgRQStorage2ENMol2Zone: TAdvStringGrid;
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
procedure sgRQStorage2ENMol2ZoneTopLeftChanged(Sender: TObject);
procedure sgRQStorage2ENMol2ZoneDblClick(Sender: TObject);
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
 // RQStorage2ENMol2ZoneObj: RQStorage2ENMol2Zone;
 // RQStorage2ENMol2ZoneFilterObj: RQStorage2ENMol2ZoneFilter;
  
  
implementation

uses Main, EditRQStorage2ENMol2Zone, EditRQStorage2ENMol2ZoneFilter;


{$R *.dfm}

var
  //frmRQStorage2ENMol2ZoneShow : TfrmRQStorage2ENMol2ZoneShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorage2ENMol2ZoneHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQStorage2ENMol2ZoneShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQStorage2ENMol2ZoneShow:=nil;
    inherited;
  end;


procedure TfrmRQStorage2ENMol2ZoneShow.FormShow(Sender: TObject);
var
  TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort;
  i: Integer;
  RQStorage2ENMol2ZoneList: RQStorage2ENMol2ZoneShortList;
  begin
  SetGridHeaders(RQStorage2ENMol2ZoneHeaders, sgRQStorage2ENMol2Zone.ColumnHeaders);
  ColCount:=100;
  TempRQStorage2ENMol2Zone :=  HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQStorage2ENMol2ZoneFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorage2ENMol2ZoneList := TempRQStorage2ENMol2Zone.getScrollableFilteredList(RQStorage2ENMol2ZoneFilter(FilterObject),0,ColCount);


  LastCount:=High(RQStorage2ENMol2ZoneList.list);

  if LastCount > -1 then
     sgRQStorage2ENMol2Zone.RowCount:=LastCount+2
  else
     sgRQStorage2ENMol2Zone.RowCount:=2;

   with sgRQStorage2ENMol2Zone do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorage2ENMol2ZoneList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQStorage2ENMol2ZoneList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQStorage2ENMol2ZoneList.list[i].userGen;
        if RQStorage2ENMol2ZoneList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(RQStorage2ENMol2ZoneList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQStorage2ENMol2Zone.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQStorage2ENMol2Zone.Row:=1;
end;

procedure TfrmRQStorage2ENMol2ZoneShow.sgRQStorage2ENMol2ZoneTopLeftChanged(Sender: TObject);
var
  TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort;
  i,CurrentRow: Integer;
  RQStorage2ENMol2ZoneList: RQStorage2ENMol2ZoneShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQStorage2ENMol2Zone.TopRow + sgRQStorage2ENMol2Zone.VisibleRowCount) = ColCount
  then
    begin
      TempRQStorage2ENMol2Zone :=  HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;
      CurrentRow:=sgRQStorage2ENMol2Zone.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQStorage2ENMol2ZoneFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorage2ENMol2ZoneList := TempRQStorage2ENMol2Zone.getScrollableFilteredList(RQStorage2ENMol2ZoneFilter(FilterObject),ColCount-1, 100);



  sgRQStorage2ENMol2Zone.RowCount:=sgRQStorage2ENMol2Zone.RowCount+100;
  LastCount:=High(RQStorage2ENMol2ZoneList.list);
  with sgRQStorage2ENMol2Zone do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorage2ENMol2ZoneList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQStorage2ENMol2ZoneList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQStorage2ENMol2ZoneList.list[i].userGen;
        if RQStorage2ENMol2ZoneList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(RQStorage2ENMol2ZoneList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQStorage2ENMol2Zone.Row:=CurrentRow-5;
   sgRQStorage2ENMol2Zone.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQStorage2ENMol2ZoneShow.sgRQStorage2ENMol2ZoneDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQStorage2ENMol2Zone,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQStorage2ENMol2ZoneShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQStorage2ENMol2Zone.RowCount-1 do
   for j:=0 to sgRQStorage2ENMol2Zone.ColCount-1 do
     sgRQStorage2ENMol2Zone.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQStorage2ENMol2ZoneShow.actViewExecute(Sender: TObject);
Var TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort;
begin
 TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;
   try
     RQStorage2ENMol2ZoneObj := TempRQStorage2ENMol2Zone.getObject(StrToInt(sgRQStorage2ENMol2Zone.Cells[0,sgRQStorage2ENMol2Zone.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorage2ENMol2ZoneEdit:=TfrmRQStorage2ENMol2ZoneEdit.Create(Application, dsView);
  try
    frmRQStorage2ENMol2ZoneEdit.ShowModal;
  finally
    frmRQStorage2ENMol2ZoneEdit.Free;
    frmRQStorage2ENMol2ZoneEdit:=nil;
  end;
end;

procedure TfrmRQStorage2ENMol2ZoneShow.actEditExecute(Sender: TObject);
Var TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort;
begin
 TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;
   try
     RQStorage2ENMol2ZoneObj := TempRQStorage2ENMol2Zone.getObject(StrToInt(sgRQStorage2ENMol2Zone.Cells[0,sgRQStorage2ENMol2Zone.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorage2ENMol2ZoneEdit:=TfrmRQStorage2ENMol2ZoneEdit.Create(Application, dsEdit);
  try
    if frmRQStorage2ENMol2ZoneEdit.ShowModal= mrOk then
      begin
        //TempRQStorage2ENMol2Zone.save(RQStorage2ENMol2ZoneObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQStorage2ENMol2ZoneEdit.Free;
    frmRQStorage2ENMol2ZoneEdit:=nil;
  end;
end;

procedure TfrmRQStorage2ENMol2ZoneShow.actDeleteExecute(Sender: TObject);
Var TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQStorage2ENMol2Zone.Cells[0,sgRQStorage2ENMol2Zone.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок МВО зі складом та місцем зберігання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQStorage2ENMol2Zone.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQStorage2ENMol2ZoneShow.actInsertExecute(Sender: TObject);
// Var TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort; 
begin
  // TempRQStorage2ENMol2Zone := HTTPRIORQStorage2ENMol2Zone as RQStorage2ENMol2ZoneControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQStorage2ENMol2ZoneObj:=RQStorage2ENMol2Zone.Create;

   //RQStorage2ENMol2ZoneObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQStorage2ENMol2ZoneEdit:=TfrmRQStorage2ENMol2ZoneEdit.Create(Application, dsInsert);
    try
      if frmRQStorage2ENMol2ZoneEdit.ShowModal = mrOk then
      begin
        if RQStorage2ENMol2ZoneObj<>nil then
            //TempRQStorage2ENMol2Zone.add(RQStorage2ENMol2ZoneObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQStorage2ENMol2ZoneEdit.Free;
      frmRQStorage2ENMol2ZoneEdit:=nil;
    end;
  finally
    RQStorage2ENMol2ZoneObj.Free;
  end;
end;

procedure TfrmRQStorage2ENMol2ZoneShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQStorage2ENMol2ZoneShow.actFilterExecute(Sender: TObject);
begin
{frmRQStorage2ENMol2ZoneFilterEdit:=TfrmRQStorage2ENMol2ZoneFilterEdit.Create(Application, dsInsert);
  try
    RQStorage2ENMol2ZoneFilterObj := RQStorage2ENMol2ZoneFilter.Create;
    SetNullIntProps(RQStorage2ENMol2ZoneFilterObj);
    SetNullXSProps(RQStorage2ENMol2ZoneFilterObj);

    if frmRQStorage2ENMol2ZoneFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQStorage2ENMol2ZoneFilter.Create;
      FilterObject := RQStorage2ENMol2ZoneFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQStorage2ENMol2ZoneFilterEdit.Free;
    frmRQStorage2ENMol2ZoneFilterEdit:=nil;
  end;}
end;

procedure TfrmRQStorage2ENMol2ZoneShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.