
unit ShowKarti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  KartiController ;


type
  TfrmKartiShow = class(TChildForm)  
  HTTPRIOKarti: THTTPRIO;
    ImageList1: TImageList;
    sgKarti: TAdvStringGrid;
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
procedure sgKartiTopLeftChanged(Sender: TObject);
procedure sgKartiDblClick(Sender: TObject);
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
 // KartiObj: Karti;
 // KartiFilterObj: KartiFilter;
  
  
implementation

uses Main, EditKarti, EditKartiFilter;


{$R *.dfm}

var
  //frmKartiShow : TfrmKartiShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  KartiHeaders: array [1..7] of String =
        ( 'Код'
          ,'Робота'
          ,'№ тех.карти'
          ,'Об"єкт'
          ,'Джерело нормативу'
          ,'Вімірювач'
          ,'Од.виміру'
        );
   

procedure TfrmKartiShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmKartiShow:=nil;
    inherited;
  end;


procedure TfrmKartiShow.FormShow(Sender: TObject);
var
  TempKarti: KartiControllerSoapPort;
  i: Integer;
  KartiList: KartiShortList;
  begin
  SetGridHeaders(KartiHeaders, sgKarti.ColumnHeaders);
  ColCount:=100;
  TempKarti :=  HTTPRIOKarti as KartiControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := KartiFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  KartiFilter(FilterObject).orderBySQL := ' kk.idobject, kk.num ';

  KartiList := TempKarti.getScrollableFilteredList(KartiFilter(FilterObject),0,ColCount);


  LastCount:=High(KartiList.list);

  if LastCount > -1 then
     sgKarti.RowCount:=LastCount+2
  else
     sgKarti.RowCount:=2;

   with sgKarti do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if KartiList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(KartiList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := KartiList.list[i].name;

        Cells[2, i + 1 ] := KartiList.list[i].numGen;
        Cells[3, i + 1 ] := KartiList.list[i].objectTypeRefName;
        Cells[4, i + 1 ] := KartiList.list[i].normaRefName;

        Cells[5, i+1] := KartiList.list[i].meter;
        Cells[6, i+1] := KartiList.list[i].measurementUnit;

        LastRow:=i+1;
        sgKarti.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgKarti.Row:=1;
end;

procedure TfrmKartiShow.sgKartiTopLeftChanged(Sender: TObject);
var
  TempKarti: KartiControllerSoapPort;
  i,CurrentRow: Integer;
  KartiList: KartiShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgKarti.TopRow + sgKarti.VisibleRowCount) = ColCount
  then
    begin
      TempKarti :=  HTTPRIOKarti as KartiControllerSoapPort;
      CurrentRow:=sgKarti.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := KartiFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  KartiList := TempKarti.getScrollableFilteredList(KartiFilter(FilterObject),ColCount-1, 100);



  sgKarti.RowCount:=sgKarti.RowCount+100;
  LastCount:=High(KartiList.list);
  with sgKarti do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if KartiList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(KartiList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := KartiList.list[i].name;

        Cells[2, i + CurrentRow ] := KartiList.list[i].numGen;
        Cells[3, i + CurrentRow ] := KartiList.list[i].objectTypeRefName;
        Cells[4, i + CurrentRow ] := KartiList.list[i].normaRefName;

        Cells[5, i+CurrentRow] := KartiList.list[i].meter;
        Cells[6, i+CurrentRow] := KartiList.list[i].measurementUnit;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgKarti.Row:=CurrentRow-5;
   sgKarti.RowCount:=LastRow+1;
  end;
end;

procedure TfrmKartiShow.sgKartiDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgKarti,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmKartiShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgKarti.RowCount-1 do
   for j:=0 to sgKarti.ColCount-1 do
     sgKarti.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmKartiShow.actViewExecute(Sender: TObject);
Var TempKarti: KartiControllerSoapPort;
begin
 TempKarti := HTTPRIOKarti as KartiControllerSoapPort;
   try
     KartiObj := TempKarti.getObject(StrToInt(sgKarti.Cells[0,sgKarti.Row]));
   except
   on EConvertError do Exit;
  end;
  frmKartiEdit:=TfrmKartiEdit.Create(Application, dsView);
  try
    frmKartiEdit.ShowModal;
  finally
    frmKartiEdit.Free;
    frmKartiEdit:=nil;
  end;
end;

procedure TfrmKartiShow.actEditExecute(Sender: TObject);
Var TempKarti: KartiControllerSoapPort;
begin
 TempKarti := HTTPRIOKarti as KartiControllerSoapPort;
   try
     KartiObj := TempKarti.getObject(StrToInt(sgKarti.Cells[0,sgKarti.Row]));
   except
   on EConvertError do Exit;
  end;
  frmKartiEdit:=TfrmKartiEdit.Create(Application, dsEdit);
  try
    if frmKartiEdit.ShowModal= mrOk then
      begin
        //TempKarti.save(KartiObj);
        UpdateGrid(Sender);
      end;
  finally
    frmKartiEdit.Free;
    frmKartiEdit:=nil;
  end;
end;

procedure TfrmKartiShow.actDeleteExecute(Sender: TObject);
Var TempKarti: KartiControllerSoapPort;
  ObjCode: Integer;
begin
 TempKarti := HTTPRIOKarti as KartiControllerSoapPort;
   try
     ObjCode := StrToInt(sgKarti.Cells[0,sgKarti.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempKarti.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmKartiShow.actInsertExecute(Sender: TObject);
Var TempKarti: KartiControllerSoapPort;
begin
  TempKarti := HTTPRIOKarti as KartiControllerSoapPort;
  KartiObj:=Karti.Create;



  try
    frmKartiEdit:=TfrmKartiEdit.Create(Application, dsInsert);
    try
      if frmKartiEdit.ShowModal = mrOk then
      begin
        if KartiObj<>nil then
            //TempKarti.add(KartiObj);
            UpdateGrid(Sender);
      end;
    finally
      frmKartiEdit.Free;
      frmKartiEdit:=nil;
    end;
  finally
    KartiObj.Free;
  end;
end;

procedure TfrmKartiShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmKartiShow.actFilterExecute(Sender: TObject);

begin
frmKartiFilterEdit:=TfrmKartiFilterEdit.Create(Application, dsEdit);
  try
  KartiFilterObj := KartiFilter.Create;
  SetNullIntProps(KartiFilterObj);
  SetNullXSProps(KartiFilterObj);
  
    if frmKartiFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := KartiFilter.Create;
      FilterObject := KartiFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmKartiFilterEdit.Free;
    frmKartiFilterEdit:=nil;
  end;
end;

procedure TfrmKartiShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.