
unit EditRQStorage;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
  	EnergyproController, EnergyproController2, RQStorageController, ENConsts,
  AdvObj;

type
  TfrmRQStorageEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;

  HTTPRIORQStorage: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  pcStorage: TPageControl;
  tsGeneral: TTabSheet;
  tsStorageZone: TTabSheet;
  lblName: TLabel;
  lblShortName: TLabel;
  lblDescription: TLabel;
  edtName: TEdit;
  edtShortName: TEdit;
  edtDescription: TMemo;
  ImageList1: TImageList;
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
  sgRQStorageZone: TAdvStringGrid;
  HTTPRIORQStorageZone: THTTPRIO;
    tsStorage2ENMol: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    sgRQStorage2ENMol: TAdvStringGrid;
    HTTPRIORQStorage2ENMol: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure actViewExecute(Sender: TObject);
  procedure actEditExecute(Sender: TObject);
  procedure actDeleteExecute(Sender: TObject);
  procedure actInsertExecute(Sender: TObject);
  procedure actUpdateExecute(Sender: TObject);
  procedure pcStorageChange(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }

  procedure UpdateGrid(Sender: TObject);

end;

var
  frmRQStorageEdit: TfrmRQStorageEdit;
  RQStorageObj: RQStorage;


implementation

uses EditRQStorageZone, RQStorageZoneController, RQStorage2ENMolController, EditRQStorage2ENMol;


{uses
    EnergyproController, EnergyproController2, RQStorageController  ;
}
{$R *.dfm}


var

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQStorageZoneHeaders: array [1..5] of String =
        ( 'Код'
          ,'Найменування'
          ,'Опис'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  RQStorage2ENMolHeaders: array [1..6] of String =
        ( 'Код'
          ,'Склад' 
          ,'Код МВО'
          ,'ПІБ МВО'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );        
        
procedure TfrmRQStorageEdit.FormShow(Sender: TObject);

begin

  SetGridHeaders(RQStorageZoneHeaders, sgRQStorageZone.ColumnHeaders);
  SetGridHeaders(RQStorage2ENMolHeaders, sgRQStorage2ENMol.ColumnHeaders);

  DisableControls([edtCode]);
  pcStorage.ActivePage := tsGeneral;
  tsStorageZone.TabVisible := not (DialogState = dsInsert);
  tsStorage2ENMol.TabVisible := not (DialogState = dsInsert);

  if DialogState = dsView then
  begin
    DisableActions([actInsert, actEdit, actDelete]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQStorageObj.code);
    edtName.Text := RQStorageObj.name;
    edtShortName.Text := RQStorageObj.shortName;
    MakeMultiline(edtDescription.Lines, RQStorageObj.description);
  end;
end;



procedure TfrmRQStorageEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorage: RQStorageControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtShortName])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;

    RQStorageObj.name := edtName.Text;
    RQStorageObj.shortName := edtShortName.Text;
    RQStorageObj.description := edtDescription.Text;

    if DialogState = dsInsert then
    begin
      RQStorageObj.code:=low(Integer);
      TempRQStorage.add(RQStorageObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQStorage.save(RQStorageObj);
    end;
  end;
end;


procedure TfrmRQStorageEdit.actViewExecute(Sender: TObject);
var TempRQStorageZone : RQStorageZoneControllerSoapPort;
    TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
begin
  if (pcStorage.ActivePage = tsStorageZone) then
  begin
    TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
    try
      RQStorageZoneObj := TempRQStorageZone.getObject(StrToInt(sgRQStorageZone.Cells[0,sgRQStorageZone.Row]));
    except
      on EConvertError do Exit;
    end;
    frmRQStorageZoneEdit:=TfrmRQStorageZoneEdit.Create(Application, dsView);
    try
      frmRQStorageZoneEdit.ShowModal;
    finally
      frmRQStorageZoneEdit.Free;
      frmRQStorageZoneEdit:=nil;
    end;
  end;

  if (pcStorage.ActivePage = tsStorage2ENMol) then
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
end;

procedure TfrmRQStorageEdit.actEditExecute(Sender: TObject);
var TempRQStorageZone : RQStorageZoneControllerSoapPort;
    TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
begin
  if (pcStorage.ActivePage = tsStorageZone) then
  begin
    TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
    try
       RQStorageZoneObj := TempRQStorageZone.getObject(StrToInt(sgRQStorageZone.Cells[0,sgRQStorageZone.Row]));
     except
     on EConvertError do Exit;
    end;

    frmRQStorageZoneEdit := TfrmRQStorageZoneEdit.Create(Application, dsEdit);
    DisableControls([frmRQStorageZoneEdit.edtRQStorageStorageName, frmRQStorageZoneEdit.spbRQStorageStorage]);

    try
      if frmRQStorageZoneEdit.ShowModal= mrOk then
        begin
          //TempRQStorageZone.save(RQStorageZoneObj);
          UpdateGrid(Sender);
        end;
    finally
      frmRQStorageZoneEdit.Free;
      frmRQStorageZoneEdit:=nil;
    end;
  end;

  if (pcStorage.ActivePage = tsStorage2ENMol) then
  begin
    TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
    try
      RQStorage2ENMolObj := TempRQStorage2ENMol.getObject(StrToInt(sgRQStorage2ENMol.Cells[0,sgRQStorage2ENMol.Row]));
    except
     on EConvertError do Exit;
    end;

    frmRQStorage2ENMolEdit := TfrmRQStorage2ENMolEdit.Create(Application, dsEdit);
    DisableControls([frmRQStorage2ENMolEdit.edtRQStorageStorageName, frmRQStorage2ENMolEdit.spbRQStorageStorage]);

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
end;

procedure TfrmRQStorageEdit.actDeleteExecute(Sender: TObject);
var TempRQStorageZone: RQStorageZoneControllerSoapPort;
    TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
    ObjCode: Integer;
begin
  if (pcStorage.ActivePage = tsStorageZone) then
  begin
    TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
    try
      ObjCode := StrToInt(sgRQStorageZone.Cells[0,sgRQStorageZone.Row]);
    except
      on EConvertError do Exit;
    end;
    if Application.MessageBox(PChar('Вы действительно хотите удалить (Місця зберігання) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        TempRQStorageZone.remove(ObjCode);
        UpdateGrid(Sender);
    end;
  end;

  if (pcStorage.ActivePage = tsStorage2ENMol) then
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
end;


procedure TfrmRQStorageEdit.actInsertExecute(Sender: TObject);

begin

  if RQStorageObj.code = LOW_INT then Exit;

  if (pcStorage.ActivePage = tsStorageZone) then
  begin
      RQStorageZoneObj := RQStorageZone.Create;
      RQStorageZoneObj.storage := RQStorage.Create;
      RQStorageZoneObj.storage.code := RQStorageObj.code;

      try
        frmRQStorageZoneEdit := TfrmRQStorageZoneEdit.Create(Application, dsInsert);
        frmRQStorageZoneEdit.edtRQStorageStorageName.Text := RQStorageObj.name;
        DisableControls([frmRQStorageZoneEdit.edtRQStorageStorageName, frmRQStorageZoneEdit.spbRQStorageStorage]);

        try
          if frmRQStorageZoneEdit.ShowModal = mrOk then
          begin
            if RQStorageZoneObj<>nil then
                UpdateGrid(Sender);
          end;
        finally
          frmRQStorageZoneEdit.Free;
          frmRQStorageZoneEdit:=nil;
        end;
      finally
        RQStorageZoneObj.Free;
      end;
  end;

  if (pcStorage.ActivePage = tsStorage2ENMol) then
  begin
    RQStorage2ENMolObj := RQStorage2ENMol.Create;
    RQStorage2ENMolObj.storageRef := RQStorageRef.Create;
    RQStorage2ENMolObj.storageRef.code := RQStorageObj.code;

    try
      frmRQStorage2ENMolEdit := TfrmRQStorage2ENMolEdit.Create(Application, dsInsert);
      frmRQStorage2ENMolEdit.edtRQStorageStorageName.Text := RQStorageObj.name;
      DisableControls([frmRQStorage2ENMolEdit.edtRQStorageStorageName, frmRQStorage2ENMolEdit.spbRQStorageStorage]);

      try
        if frmRQStorage2ENMolEdit.ShowModal = mrOk then
        begin
          if RQStorage2ENMolObj<>nil then
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

end;


procedure TfrmRQStorageEdit.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQStorageEdit.UpdateGrid(Sender: TObject);
var i, j: Integer;
begin
  if (pcStorage.ActivePage = tsStorageZone) then
  begin
     for i:=1 to sgRQStorageZone.RowCount-1 do
       for j:=0 to sgRQStorageZone.ColCount-1 do
         sgRQStorageZone.Cells[j,i]:='';
  end;

  if (pcStorage.ActivePage = tsStorage2ENMol) then
  begin
     for i:=1 to sgRQStorage2ENMol.RowCount-1 do
       for j:=0 to sgRQStorage2ENMol.ColCount-1 do
         sgRQStorage2ENMol.Cells[j,i]:='';
  end;

  pcStorageChange(Sender);
end;


procedure TfrmRQStorageEdit.pcStorageChange(Sender: TObject);
var
  i : Integer;
  TempRQStorageZone : RQStorageZoneControllerSoapPort;
  RQStorageZoneList : RQStorageZoneShortList;
  zoneFilter : RQStorageZoneFilter;

  TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
  RQStorage2ENMolList : RQStorage2ENMolShortList;
  s2MolFilter : RQStorage2ENMolFilter;

begin
  if RQStorageObj.code = LOW_INT then Exit;

  if (pcStorage.ActivePage = tsStorageZone) then
  begin

    TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;

    zoneFilter := RQStorageZoneFilter.Create;
    SetNullIntProps(zoneFilter);
    SetNullXSProps(zoneFilter);

    zoneFilter.storage := RQStorage.Create;
    zoneFilter.storage.code := RQStorageObj.code;

    zoneFilter.orderBySQL := 'name';

    RQStorageZoneList := TempRQStorageZone.getScrollableFilteredList(zoneFilter,0,-1);

    if High(RQStorageZoneList.list) > -1 then
      sgRQStorageZone.RowCount := High(RQStorageZoneList.list)+2
    else
      sgRQStorageZone.RowCount := 2;

    with sgRQStorageZone do
      for i:=0 to High(RQStorageZoneList.list) do
        begin
          Application.ProcessMessages;

          if RQStorageZoneList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQStorageZoneList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := RQStorageZoneList.list[i].name;
          Cells[2,i+1] := RQStorageZoneList.list[i].description;
          Cells[3,i+1] := RQStorageZoneList.list[i].userGen;
          if RQStorageZoneList.list[i].dateEdit = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := XSDateTimeWithDate2String(RQStorageZoneList.list[i].dateEdit);
          LastRow:=i+1;
          sgRQStorageZone.RowCount:=LastRow+1;
        end;
    sgRQStorageZone.Row:=1;
  end;

  if (pcStorage.ActivePage = tsStorage2ENMol) then
  begin
    
    TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;

    s2MolFilter := RQStorage2ENMolFilter.Create;
    SetNullIntProps(s2MolFilter);
    SetNullXSProps(s2MolFilter);

    s2MolFilter.storageRef := RQStorageRef.Create;
    s2MolFilter.storageRef.code := RQStorageObj.code;

    RQStorage2ENMolList := TempRQStorage2ENMol.getScrollableFilteredList(RQStorage2ENMolFilter(s2MolFilter),0,-1);


    if High(RQStorage2ENMolList.list) > -1 then
       sgRQStorage2ENMol.RowCount := High(RQStorage2ENMolList.list)+2
    else
       sgRQStorage2ENMol.RowCount := 2;

     with sgRQStorage2ENMol do
      for i:=0 to High(RQStorage2ENMolList.list) do
        begin
          Application.ProcessMessages;
          {( 'Код'
          ,'Склад'
          ,'Код МВО'
          ,'ПІБ МВО'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'}

          if RQStorage2ENMolList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQStorage2ENMolList.list[i].code)
          else
          Cells[0,i+1] := '';

          Cells[1,i+1] := RQStorage2ENMolList.list[i].storageRefName;
          Cells[2,i+1] := RQStorage2ENMolList.list[i].molRefFinCode;
          Cells[3,i+1] := RQStorage2ENMolList.list[i].molRefName;

          Cells[4,i+1] := RQStorage2ENMolList.list[i].userGen;

          if RQStorage2ENMolList.list[i].dateEdit = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := XSDateTimeWithDate2String(RQStorage2ENMolList.list[i].dateEdit);

          LastRow:=i+1;
          sgRQStorage2ENMol.RowCount:=LastRow+1;
        end;
     sgRQStorage2ENMol.Row:=1;
  end;

end;

end.
