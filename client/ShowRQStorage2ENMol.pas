
unit ShowRQStorage2ENMol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQStorage2ENMolController ;


type
  TfrmRQStorage2ENMolShow = class(TChildForm)  
  HTTPRIORQStorage2ENMol: THTTPRIO;
    ImageList1: TImageList;
    sgRQStorage2ENMol: TAdvStringGrid;
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
procedure sgRQStorage2ENMolTopLeftChanged(Sender: TObject);
procedure sgRQStorage2ENMolDblClick(Sender: TObject);
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
 // RQStorage2ENMolObj: RQStorage2ENMol;
 // RQStorage2ENMolFilterObj: RQStorage2ENMolFilter;
  
  
implementation

uses Main, EditRQStorage2ENMol, EditRQStorage2ENMolFilter;


{$R *.dfm}

var
  //frmRQStorage2ENMolShow : TfrmRQStorage2ENMolShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorage2ENMolHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQStorage2ENMolShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQStorage2ENMolShow:=nil;
    inherited;
  end;


procedure TfrmRQStorage2ENMolShow.FormShow(Sender: TObject);
var
  TempRQStorage2ENMol: RQStorage2ENMolControllerSoapPort;
  i: Integer;
  RQStorage2ENMolList: RQStorage2ENMolShortList;
  begin
  SetGridHeaders(RQStorage2ENMolHeaders, sgRQStorage2ENMol.ColumnHeaders);
  ColCount:=100;
  TempRQStorage2ENMol :=  HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQStorage2ENMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorage2ENMolList := TempRQStorage2ENMol.getScrollableFilteredList(RQStorage2ENMolFilter(FilterObject),0,ColCount);


  LastCount:=High(RQStorage2ENMolList.list);

  if LastCount > -1 then
     sgRQStorage2ENMol.RowCount:=LastCount+2
  else
     sgRQStorage2ENMol.RowCount:=2;

   with sgRQStorage2ENMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorage2ENMolList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQStorage2ENMolList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQStorage2ENMolList.list[i].userGen;
        if RQStorage2ENMolList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(RQStorage2ENMolList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQStorage2ENMol.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQStorage2ENMol.Row:=1;
end;

procedure TfrmRQStorage2ENMolShow.sgRQStorage2ENMolTopLeftChanged(Sender: TObject);
var
  TempRQStorage2ENMol: RQStorage2ENMolControllerSoapPort;
  i,CurrentRow: Integer;
  RQStorage2ENMolList: RQStorage2ENMolShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQStorage2ENMol.TopRow + sgRQStorage2ENMol.VisibleRowCount) = ColCount
  then
    begin
      TempRQStorage2ENMol :=  HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
      CurrentRow:=sgRQStorage2ENMol.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQStorage2ENMolFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorage2ENMolList := TempRQStorage2ENMol.getScrollableFilteredList(RQStorage2ENMolFilter(FilterObject),ColCount-1, 100);



  sgRQStorage2ENMol.RowCount:=sgRQStorage2ENMol.RowCount+100;
  LastCount:=High(RQStorage2ENMolList.list);
  with sgRQStorage2ENMol do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorage2ENMolList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQStorage2ENMolList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQStorage2ENMolList.list[i].userGen;
        if RQStorage2ENMolList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(RQStorage2ENMolList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQStorage2ENMol.Row:=CurrentRow-5;
   sgRQStorage2ENMol.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQStorage2ENMolShow.sgRQStorage2ENMolDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQStorage2ENMol,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQStorage2ENMolShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQStorage2ENMol.RowCount-1 do
   for j:=0 to sgRQStorage2ENMol.ColCount-1 do
     sgRQStorage2ENMol.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQStorage2ENMolShow.actViewExecute(Sender: TObject);
Var TempRQStorage2ENMol: RQStorage2ENMolControllerSoapPort;
begin
 TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
   try
     RQStorage2ENMolObj := TempRQStorage2ENMol.getObject(StrToInt(sgRQStorage2ENMol.Cells[0,sgRQStorage2ENMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorage2ENMolEdit:=TfrmRQStorage2ENMolEdit.Create(Application, dsView);
  try
    frmRQStorage2ENMolEdit.ShowModal;
  finally
    frmRQStorage2ENMolEdit.Free;
    frmRQStorage2ENMolEdit:=nil;
  end;
end;

procedure TfrmRQStorage2ENMolShow.actEditExecute(Sender: TObject);
Var TempRQStorage2ENMol: RQStorage2ENMolControllerSoapPort;
begin
 TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
   try
     RQStorage2ENMolObj := TempRQStorage2ENMol.getObject(StrToInt(sgRQStorage2ENMol.Cells[0,sgRQStorage2ENMol.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorage2ENMolEdit:=TfrmRQStorage2ENMolEdit.Create(Application, dsEdit);
  try
    if frmRQStorage2ENMolEdit.ShowModal= mrOk then
      begin
        //TempRQStorage2ENMol.save(RQStorage2ENMolObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQStorage2ENMolEdit.Free;
    frmRQStorage2ENMolEdit:=nil;
  end;
end;

procedure TfrmRQStorage2ENMolShow.actDeleteExecute(Sender: TObject);
Var TempRQStorage2ENMol: RQStorage2ENMolControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQStorage2ENMol.Cells[0,sgRQStorage2ENMol.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок складів з МВО) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQStorage2ENMol.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQStorage2ENMolShow.actInsertExecute(Sender: TObject);
// Var TempRQStorage2ENMol: RQStorage2ENMolControllerSoapPort; 
begin
  // TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQStorage2ENMolObj:=RQStorage2ENMol.Create;

   //RQStorage2ENMolObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQStorage2ENMolEdit:=TfrmRQStorage2ENMolEdit.Create(Application, dsInsert);
    try
      if frmRQStorage2ENMolEdit.ShowModal = mrOk then
      begin
        if RQStorage2ENMolObj<>nil then
            //TempRQStorage2ENMol.add(RQStorage2ENMolObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQStorage2ENMolEdit.Free;
      frmRQStorage2ENMolEdit:=nil;
    end;
  finally
    RQStorage2ENMolObj.Free;
  end;
end;

procedure TfrmRQStorage2ENMolShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQStorage2ENMolShow.actFilterExecute(Sender: TObject);
begin
{frmRQStorage2ENMolFilterEdit:=TfrmRQStorage2ENMolFilterEdit.Create(Application, dsInsert);
  try
    RQStorage2ENMolFilterObj := RQStorage2ENMolFilter.Create;
    SetNullIntProps(RQStorage2ENMolFilterObj);
    SetNullXSProps(RQStorage2ENMolFilterObj);

    if frmRQStorage2ENMolFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQStorage2ENMolFilter.Create;
      FilterObject := RQStorage2ENMolFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQStorage2ENMolFilterEdit.Free;
    frmRQStorage2ENMolFilterEdit:=nil;
  end;}
end;

procedure TfrmRQStorage2ENMolShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.