
unit ShowRQStorageZone2TKMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQStorageZone2TKMaterialsController ;


type
  TfrmRQStorageZone2TKMaterialsShow = class(TChildForm)  
  HTTPRIORQStorageZone2TKMaterials: THTTPRIO;
    ImageList1: TImageList;
    sgRQStorageZone2TKMaterials: TAdvStringGrid;
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
procedure sgRQStorageZone2TKMaterialsTopLeftChanged(Sender: TObject);
procedure sgRQStorageZone2TKMaterialsDblClick(Sender: TObject);
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
 // RQStorageZone2TKMaterialsObj: RQStorageZone2TKMaterials;
 // RQStorageZone2TKMaterialsFilterObj: RQStorageZone2TKMaterialsFilter;
  
  
implementation

uses Main, EditRQStorageZone2TKMaterials, EditRQStorageZone2TKMaterialsFilter;


{$R *.dfm}

var
  //frmRQStorageZone2TKMaterialsShow : TfrmRQStorageZone2TKMaterialsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorageZone2TKMaterialsHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQStorageZone2TKMaterialsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQStorageZone2TKMaterialsShow:=nil;
    inherited;
  end;


procedure TfrmRQStorageZone2TKMaterialsShow.FormShow(Sender: TObject);
var
  TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort;
  i: Integer;
  RQStorageZone2TKMaterialsList: RQStorageZone2TKMaterialsShortList;
  begin
  SetGridHeaders(RQStorageZone2TKMaterialsHeaders, sgRQStorageZone2TKMaterials.ColumnHeaders);
  ColCount:=100;
  TempRQStorageZone2TKMaterials :=  HTTPRIORQStorageZone2TKMaterials as RQStorageZone2TKMaterialsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageZone2TKMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageZone2TKMaterialsList := TempRQStorageZone2TKMaterials.getScrollableFilteredList(RQStorageZone2TKMaterialsFilter(FilterObject),0,ColCount);


  LastCount:=High(RQStorageZone2TKMaterialsList.list);

  if LastCount > -1 then
     sgRQStorageZone2TKMaterials.RowCount:=LastCount+2
  else
     sgRQStorageZone2TKMaterials.RowCount:=2;

   with sgRQStorageZone2TKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorageZone2TKMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQStorageZone2TKMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQStorageZone2TKMaterialsList.list[i].userGen;
        if RQStorageZone2TKMaterialsList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(RQStorageZone2TKMaterialsList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQStorageZone2TKMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQStorageZone2TKMaterials.Row:=1;
end;

procedure TfrmRQStorageZone2TKMaterialsShow.sgRQStorageZone2TKMaterialsTopLeftChanged(Sender: TObject);
var
  TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort;
  i,CurrentRow: Integer;
  RQStorageZone2TKMaterialsList: RQStorageZone2TKMaterialsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQStorageZone2TKMaterials.TopRow + sgRQStorageZone2TKMaterials.VisibleRowCount) = ColCount
  then
    begin
      TempRQStorageZone2TKMaterials :=  HTTPRIORQStorageZone2TKMaterials as RQStorageZone2TKMaterialsControllerSoapPort;
      CurrentRow:=sgRQStorageZone2TKMaterials.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQStorageZone2TKMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQStorageZone2TKMaterialsList := TempRQStorageZone2TKMaterials.getScrollableFilteredList(RQStorageZone2TKMaterialsFilter(FilterObject),ColCount-1, 100);



  sgRQStorageZone2TKMaterials.RowCount:=sgRQStorageZone2TKMaterials.RowCount+100;
  LastCount:=High(RQStorageZone2TKMaterialsList.list);
  with sgRQStorageZone2TKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQStorageZone2TKMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQStorageZone2TKMaterialsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQStorageZone2TKMaterialsList.list[i].userGen;
        if RQStorageZone2TKMaterialsList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(RQStorageZone2TKMaterialsList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQStorageZone2TKMaterials.Row:=CurrentRow-5;
   sgRQStorageZone2TKMaterials.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQStorageZone2TKMaterialsShow.sgRQStorageZone2TKMaterialsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQStorageZone2TKMaterials,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQStorageZone2TKMaterialsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQStorageZone2TKMaterials.RowCount-1 do
   for j:=0 to sgRQStorageZone2TKMaterials.ColCount-1 do
     sgRQStorageZone2TKMaterials.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQStorageZone2TKMaterialsShow.actViewExecute(Sender: TObject);
Var TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort;
begin
 TempRQStorageZone2TKMaterials := HTTPRIORQStorageZone2TKMaterials as RQStorageZone2TKMaterialsControllerSoapPort;
   try
     RQStorageZone2TKMaterialsObj := TempRQStorageZone2TKMaterials.getObject(StrToInt(sgRQStorageZone2TKMaterials.Cells[0,sgRQStorageZone2TKMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageZone2TKMaterialsEdit:=TfrmRQStorageZone2TKMaterialsEdit.Create(Application, dsView);
  try
    frmRQStorageZone2TKMaterialsEdit.ShowModal;
  finally
    frmRQStorageZone2TKMaterialsEdit.Free;
    frmRQStorageZone2TKMaterialsEdit:=nil;
  end;
end;

procedure TfrmRQStorageZone2TKMaterialsShow.actEditExecute(Sender: TObject);
Var TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort;
begin
 TempRQStorageZone2TKMaterials := HTTPRIORQStorageZone2TKMaterials as RQStorageZone2TKMaterialsControllerSoapPort;
   try
     RQStorageZone2TKMaterialsObj := TempRQStorageZone2TKMaterials.getObject(StrToInt(sgRQStorageZone2TKMaterials.Cells[0,sgRQStorageZone2TKMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQStorageZone2TKMaterialsEdit:=TfrmRQStorageZone2TKMaterialsEdit.Create(Application, dsEdit);
  try
    if frmRQStorageZone2TKMaterialsEdit.ShowModal= mrOk then
      begin
        //TempRQStorageZone2TKMaterials.save(RQStorageZone2TKMaterialsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQStorageZone2TKMaterialsEdit.Free;
    frmRQStorageZone2TKMaterialsEdit:=nil;
  end;
end;

procedure TfrmRQStorageZone2TKMaterialsShow.actDeleteExecute(Sender: TObject);
Var TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQStorageZone2TKMaterials := HTTPRIORQStorageZone2TKMaterials as RQStorageZone2TKMaterialsControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQStorageZone2TKMaterials.Cells[0,sgRQStorageZone2TKMaterials.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв''язок норм. матеріалів з місцями зберігання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQStorageZone2TKMaterials.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQStorageZone2TKMaterialsShow.actInsertExecute(Sender: TObject);
// Var TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort; 
begin
  // TempRQStorageZone2TKMaterials := HTTPRIORQStorageZone2TKMaterials as RQStorageZone2TKMaterialsControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQStorageZone2TKMaterialsObj:=RQStorageZone2TKMaterials.Create;

   //RQStorageZone2TKMaterialsObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQStorageZone2TKMaterialsEdit:=TfrmRQStorageZone2TKMaterialsEdit.Create(Application, dsInsert);
    try
      if frmRQStorageZone2TKMaterialsEdit.ShowModal = mrOk then
      begin
        if RQStorageZone2TKMaterialsObj<>nil then
            //TempRQStorageZone2TKMaterials.add(RQStorageZone2TKMaterialsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQStorageZone2TKMaterialsEdit.Free;
      frmRQStorageZone2TKMaterialsEdit:=nil;
    end;
  finally
    RQStorageZone2TKMaterialsObj.Free;
  end;
end;

procedure TfrmRQStorageZone2TKMaterialsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQStorageZone2TKMaterialsShow.actFilterExecute(Sender: TObject);
begin
{frmRQStorageZone2TKMaterialsFilterEdit:=TfrmRQStorageZone2TKMaterialsFilterEdit.Create(Application, dsInsert);
  try
    RQStorageZone2TKMaterialsFilterObj := RQStorageZone2TKMaterialsFilter.Create;
    SetNullIntProps(RQStorageZone2TKMaterialsFilterObj);
    SetNullXSProps(RQStorageZone2TKMaterialsFilterObj);

    if frmRQStorageZone2TKMaterialsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQStorageZone2TKMaterialsFilter.Create;
      FilterObject := RQStorageZone2TKMaterialsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQStorageZone2TKMaterialsFilterEdit.Free;
    frmRQStorageZone2TKMaterialsFilterEdit:=nil;
  end;}
end;

procedure TfrmRQStorageZone2TKMaterialsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.