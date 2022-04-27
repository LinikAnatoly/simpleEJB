
unit ShowSpr_matherial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  Spr_matherialController ;


type
  TfrmSpr_matherialShow = class(TChildForm)  
  HTTPRIOSpr_matherial: THTTPRIO;
    ImageList1: TImageList;
    sgSpr_matherial: TAdvStringGrid;
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
procedure sgSpr_matherialTopLeftChanged(Sender: TObject);
procedure sgSpr_matherialDblClick(Sender: TObject);
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
 // Spr_matherialObj: Spr_matherial;
 // Spr_matherialFilterObj: Spr_matherialFilter;
  
  
implementation

uses Main, EditSpr_matherial, EditSpr_matherialFilter;


{$R *.dfm}

var
  //frmSpr_matherialShow : TfrmSpr_matherialShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  Spr_matherialHeaders: array [1..3] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
        );
   

procedure TfrmSpr_matherialShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSpr_matherialShow:=nil;
    inherited;
  end;


procedure TfrmSpr_matherialShow.FormShow(Sender: TObject);
var
  TempSpr_matherial: Spr_matherialControllerSoapPort;
  i: Integer;
  Spr_matherialList: Spr_matherialShortList;
  begin
  SetGridHeaders(Spr_matherialHeaders, sgSpr_matherial.ColumnHeaders);
  ColCount:=100;
  TempSpr_matherial :=  HTTPRIOSpr_matherial as Spr_matherialControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := Spr_matherialFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilter(FilterObject),0,ColCount);


  LastCount:=High(Spr_matherialList.list);

  if LastCount > -1 then
     sgSpr_matherial.RowCount:=LastCount+2
  else
     sgSpr_matherial.RowCount:=2;

   with sgSpr_matherial do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if Spr_matherialList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(Spr_matherialList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := Spr_matherialList.list[i].name;
        Cells[2,i+1] := Spr_matherialList.list[i].measurementName;
        LastRow:=i+1;
        sgSpr_matherial.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSpr_matherial.Row:=1;
end;

procedure TfrmSpr_matherialShow.sgSpr_matherialTopLeftChanged(Sender: TObject);
var
  TempSpr_matherial: Spr_matherialControllerSoapPort;
  i,CurrentRow: Integer;
  Spr_matherialList: Spr_matherialShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSpr_matherial.TopRow + sgSpr_matherial.VisibleRowCount) = ColCount
  then
    begin
      TempSpr_matherial :=  HTTPRIOSpr_matherial as Spr_matherialControllerSoapPort;
      CurrentRow:=sgSpr_matherial.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := Spr_matherialFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilter(FilterObject),ColCount-1, 100);



  sgSpr_matherial.RowCount:=sgSpr_matherial.RowCount+100;
  LastCount:=High(Spr_matherialList.list);
  with sgSpr_matherial do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if Spr_matherialList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(Spr_matherialList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := Spr_matherialList.list[i].name;
        Cells[2,i+CurrentRow] := Spr_matherialList.list[i].measurementName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSpr_matherial.Row:=CurrentRow-5;
   sgSpr_matherial.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSpr_matherialShow.sgSpr_matherialDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSpr_matherial,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSpr_matherialShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSpr_matherial.RowCount-1 do
   for j:=0 to sgSpr_matherial.ColCount-1 do
     sgSpr_matherial.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSpr_matherialShow.actViewExecute(Sender: TObject);
Var TempSpr_matherial: Spr_matherialControllerSoapPort;
begin
 TempSpr_matherial := HTTPRIOSpr_matherial as Spr_matherialControllerSoapPort;
   try
     Spr_matherialObj := TempSpr_matherial.getObject(StrToInt(sgSpr_matherial.Cells[0,sgSpr_matherial.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSpr_matherialEdit:=TfrmSpr_matherialEdit.Create(Application, dsView);
  try
    frmSpr_matherialEdit.ShowModal;
  finally
    frmSpr_matherialEdit.Free;
    frmSpr_matherialEdit:=nil;
  end;
end;

procedure TfrmSpr_matherialShow.actEditExecute(Sender: TObject);
Var TempSpr_matherial: Spr_matherialControllerSoapPort;
begin
 TempSpr_matherial := HTTPRIOSpr_matherial as Spr_matherialControllerSoapPort;
   try
     Spr_matherialObj := TempSpr_matherial.getObject(StrToInt(sgSpr_matherial.Cells[0,sgSpr_matherial.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSpr_matherialEdit:=TfrmSpr_matherialEdit.Create(Application, dsEdit);
  try
    if frmSpr_matherialEdit.ShowModal= mrOk then
      begin
        //TempSpr_matherial.save(Spr_matherialObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSpr_matherialEdit.Free;
    frmSpr_matherialEdit:=nil;
  end;
end;

procedure TfrmSpr_matherialShow.actDeleteExecute(Sender: TObject);
Var TempSpr_matherial: Spr_matherialControllerSoapPort;
  ObjCode: Integer;
begin
 TempSpr_matherial := HTTPRIOSpr_matherial as Spr_matherialControllerSoapPort;
   try
     ObjCode := StrToInt(sgSpr_matherial.Cells[0,sgSpr_matherial.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Матеріали) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSpr_matherial.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSpr_matherialShow.actInsertExecute(Sender: TObject);
Var TempSpr_matherial: Spr_matherialControllerSoapPort;
begin
  TempSpr_matherial := HTTPRIOSpr_matherial as Spr_matherialControllerSoapPort;
  Spr_matherialObj:=Spr_matherial.Create;



  try
    frmSpr_matherialEdit:=TfrmSpr_matherialEdit.Create(Application, dsInsert);
    try
      if frmSpr_matherialEdit.ShowModal = mrOk then
      begin
        if Spr_matherialObj<>nil then
            //TempSpr_matherial.add(Spr_matherialObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSpr_matherialEdit.Free;
      frmSpr_matherialEdit:=nil;
    end;
  finally
    Spr_matherialObj.Free;
  end;
end;

procedure TfrmSpr_matherialShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSpr_matherialShow.actFilterExecute(Sender: TObject);
begin
frmSpr_matherialFilterEdit:=TfrmSpr_matherialFilterEdit.Create(Application, dsEdit);
  try

    Spr_matherialFilterObj := Spr_matherialFilter.Create;
    SetNullIntProps(Spr_matherialFilterObj);
    SetNullXSProps(Spr_matherialFilterObj);

    if frmSpr_matherialFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := Spr_matherialFilter.Create;
      FilterObject := Spr_matherialFilterObj;
      Spr_matherialFilter(FilterObject).conditionSQL := ' id_tmesure_unit is not null' ;
      Spr_matherialFilter(FilterObject).orderBySQL := 'name' ;
      actUpdateExecute(Sender);
    end;
  finally
    frmSpr_matherialFilterEdit.Free;
    frmSpr_matherialFilterEdit:=nil;
  end;
end;

procedure TfrmSpr_matherialShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.